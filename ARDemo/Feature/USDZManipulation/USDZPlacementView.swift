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
        configureAR()
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureAR() {
        guard let modelURL = Bundle.main.url(forResource: "pie_lemon_meringue", withExtension: "usdz") else {
            fatalError("Failed to find the USDZ file")
        }
        print("Model URL: \(modelURL)")

        do {
            let file = try Entity.load(contentsOf: modelURL)
            print("File loaded successfully: \(file)")

            let anchor = AnchorEntity()
            anchor.addChild(file)
            scene.addAnchor(anchor)
        } catch {
            print("Failed to load USDZ file: \(error)")
        }
    }

}
