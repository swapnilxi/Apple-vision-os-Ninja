#
#  convert-model.py
#  ML-on-VisionOS
# Created by Swapnil Gupta on 22/03/25.
import coremltools as ct
import torch

# Load the PyTorch model
print("Loading PyTorch model...")
model = torch.load('./models/flowers_dataset_model.pkl', map_location=torch.device('cpu'))
model.eval()

# Trace the model with an example input
example_input = torch.rand(1, 3, 224, 224)  # Adjust input shape as needed
traced_model = torch.jit.trace(model, example_input)

# Convert the traced model to Core ML
class_labels = ["class1", "class2", "class3"]  # Replace with actual class names
coreml_model = ct.convert(
    traced_model,
    inputs=[ct.ImageType(name="input_image", shape=example_input.shape, scale=1/255.0)],
    classifier_config=ct.ClassifierConfig(class_labels)
)

# Save the Core ML model
coreml_model.save("FlowerClassifier.mlmodel")
print("Model conversion complete. Saved as FlowerClassifier.mlmodel.")
"""
# 2. Trace the model with an example input
example_input = torch.rand(1, 3, 224, 224)
traced_model = torch.jit.trace(model, example_input)

# 3. Convert to CoreML
class_labels = [str(i) for i in range(102)]  # Replace with actual flower names if available

mlmodel = ct.convert(
    traced_model,
    inputs=[ct.ImageType(name="input_image", shape=example_input.shape, scale=1/255.0, bias=[0, 0, 0])],
    classifier_config=ct.ClassifierConfig(class_labels)
)

# 4. Save the model
mlmodel.save("FlowerClassifier.mlmodel")
"""

print("Model conversion complete. Saved as FlowerClassifier.mlmodel.")
