//
//  USDZFilePlacement.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 14.07.23.
//

import SwiftUI
import ARKit
import RealityKit

class USDZPlacementView: ARView, ObservableObject {
    required init(frame frameRect: CGRect = .zero) {
        super.init(frame: frameRect)
        //configureAR()
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureAR(fileName: String) {
        guard let modelURL = Bundle.main.url(forResource: fileName, withExtension: "usdz") else {
            fatalError("Failed to find the USDZ file")
        }
        print("Model URL: \(modelURL)")

        do {
            let file = try Entity.load(contentsOf: modelURL)
            print("File loaded successfully: \(file)")

            let anchor = AnchorEntity()
            anchor.addChild(file)
            
            // Position the entity at the center of the scene
            let bounds = file.visualBounds(relativeTo: nil)
            let center = bounds.center
            anchor.position = center
            
            scene.addAnchor(anchor)
        } catch {
            print("Failed to load USDZ file: \(error)")
        }
    }


    func clearScene(anchor: AnchorEntity) {
        scene.removeAnchor(anchor)
    }
}
