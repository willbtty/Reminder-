//
//  CameraViewWrapper.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/19/26.
//
import SwiftUI

struct CameraViewWrapper: View {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    let model = ScoopDetector()
    var body: some View {
        CameraView(image: $selectedImage)
            .safeAreaPadding(0)
            .onChange(of: selectedImage) {
                if selectedImage != nil {
                    dismiss()
                    model.analyzeImage(image: selectedImage!)
                }
            }
    }
}
