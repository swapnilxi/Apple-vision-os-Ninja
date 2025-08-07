//
//  ChatUI.swift
//  MS-Teams-VisionOS
//
//  Created by swapnil on 8/4/25.
//

import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct ChatUI: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hello! How can I help you today?", isUser: false)
    ]
    @State private var inputText: String = ""

    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isUser { Spacer() }
                                Text(message.text)
                                    .padding(10)
                                    .background(message.isUser ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: 300, alignment: message.isUser ? .trailing : .leading)
                                if !message.isUser { Spacer() }
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
                .background(Color(.systemGroupedBackground))
                .cornerRadius(12)
                .onChange(of: messages.count) { _ in
                    // Auto-scroll to latest message
                    if let last = messages.last {
                        withAnimation {
                            scrollView.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }
            HStack {
                TextField("Type a message...", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 40)
                    .onSubmit {
                                if !inputText.isEmpty { sendMessage() }
                            }
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(inputText.isEmpty ? .gray : .blue)
                }
                .disabled(inputText.isEmpty)
            }
            .padding(.top, 4)
        }
        .padding()
    }

    func sendMessage() {
        let userMessage = ChatMessage(text: inputText, isUser: true)
        messages.append(userMessage)
        inputText = ""

        // Placeholder: Simulate bot response after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let botReply = ChatMessage(text: "You said: \(userMessage.text)", isUser: false)
            messages.append(botReply)
        }
    }
}
