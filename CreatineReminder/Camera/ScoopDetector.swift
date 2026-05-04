//
//  ScoopDetector.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/17/26.
//

import Vision
import CoreML
import UIKit
import Combine
import ImageIO
import SwiftUI

class ScoopDetector: UIViewController {
    var isAnalyzingImage = false
    
    func analyzeImage(image: UIImage) {
        DispatchQueue.main.async { self.isAnalyzingImage = true }
        
        guard let ciImage = CIImage(image: image) else {
            DispatchQueue.main.async { self.isAnalyzingImage = false }
            return
        }
        
        let model: VNCoreMLModel
        do {
            model = try VNCoreMLModel(for: ScoopClassifier(configuration: MLModelConfiguration()).model)
        } catch {
            DispatchQueue.main.async { self.isAnalyzingImage = false }
            return
        }
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            self?.processClassifications(for: request, error: error)
        }
        request.imageCropAndScaleOption = .centerCrop
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        DispatchQueue.global(qos: .userInitiated).async {
            try? handler.perform([request])
            DispatchQueue.main.async {
                self.isAnalyzingImage = false
            }
        }
    }
    
    private func processClassifications(for request: VNRequest, error: Error?) {
        // Handle classification results
        if let error = error {
            print("Classification error: \(error)")
            return
        }
        guard let results = request.results as? [VNClassificationObservation] else {
            print("No classification results")
            return
        }
        // Example: print top result
        if let top = results.first {
            print("Top classification: \(top.identifier) (confidence: \(top.confidence))")
        }
    }
}
