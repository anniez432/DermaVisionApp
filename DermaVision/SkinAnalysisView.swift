//
//  SkinAnalysisView.swift
//  DermaVision
//
//  Created by Annie Z on 6/21/25.
//

import SwiftUI
import UIKit

struct SkinAnalysisView: View {
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(spacing: 15){
            Text("Start Your Skin Analysis")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.1, green: 0.25, blue: 0.6))
            Text("Use the webcam or upload an image to analyze your skin.")
            
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
            }
            
            HStack{
                Button("Upload Image"){
                    sourceType = .photoLibrary
                    showImagePicker = true
                }
                Button("Take Photo"){
                    if UIImagePickerController.isSourceTypeAvailable(.camera){
                        sourceType = .camera
                        showImagePicker = true
                    } else{
                        print("Camera not available")
                    }
                }
                
                Button("Analyze"){
                    if let uiImage = inputImage {
                        sendToBackend(image: uiImage)
                    }
                }
            }
        }
        .navigationTitle("Skin Analysis")
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
            image = Image(uiImage: inputImage)
    }
    
    func sendToBackend(image: UIImage){
        guard let url = URL(string: "https://dermavisionapp.onrender.com") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let imageData = image.jpegData(compressionQuality: 0.8)!
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"skin.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let responseString = String(data: data, encoding: .utf8) {
                print("Response:", responseString)
            } else if let error = error {
                print("Upload error:", error.localizedDescription)
            }
        }.resume()
        
    }
        
}


#Preview{
    WelcomeView()
}
