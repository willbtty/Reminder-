//
//  CameraViewWrapper.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/19/26.
//

import SwiftUI
import AVFoundation

struct CameraViewWrapper: View {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    @State private var cameraAuthorized = false
    let model = ScoopDetector()

    var body: some View {
        Group {
            if cameraAuthorized {
                CameraView(image: $selectedImage)
                    .safeAreaPadding(0)
                    .onChange(of: selectedImage) {
                        if let image = selectedImage {
                            dismiss()
                            model.analyzeImage(image: image)
                        }
                    }
            } else {
                VStack(spacing: 16) {
                    Text("Camera access is required to detect creatine scoops.")
                        .multilineTextAlignment(.center)
                    Button("Open Settings") {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    }
                }
                .padding()
            }
        }
        .task {
            await requestCameraAccess()
        }
    }

    private func requestCameraAccess() async {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            cameraAuthorized = true
        case .notDetermined:
            cameraAuthorized = await AVCaptureDevice.requestAccess(for: .video)
        default:
            cameraAuthorized = false
        }
    }
}
