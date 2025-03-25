import SwiftUI
import RealityKit
import UniformTypeIdentifiers

struct ImagePickerView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var showingSaveAlert = false
    @State private var saveError: Error?
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                    .padding()
                
                Button("Save Image") {
                    saveImage(image)
                }
                .buttonStyle(.bordered)
                .padding()
            }
            
            Button("Take Photo") {
                isImagePickerPresented = true
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            CameraView(selectedImage: $selectedImage)
        }
        .alert("Save Status", isPresented: $showingSaveAlert) {
            Button("OK") {}
        } message: {
            if let error = saveError {
                Text("Failed to save image: \(error.localizedDescription)")
            } else {
                Text("Image saved successfully!")
            }
        }
    }
    
    private func saveImage(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            saveError = NSError(domain: "ImageSaving", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not convert image to JPEG"])
            showingSaveAlert = true
            return
        }
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filename = documentsDirectory.appendingPathComponent("captured_image_\(Date().timeIntervalSince1970).jpg")
        
        do {
            try data.write(to: filename)
            saveError = nil
            showingSaveAlert = true
        } catch {
            saveError = error
            showingSaveAlert = true
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    ImagePickerView()
}