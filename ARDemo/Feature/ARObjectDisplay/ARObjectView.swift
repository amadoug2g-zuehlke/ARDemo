//
//  CurtomARView.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 12.07.23.
//

import ARKit
import RealityKit
import SwiftUI

class ARObjectView : ARView, ObservableObject {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
    func placeBlueBlock() {
        let box = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let entity = ModelEntity(mesh: box, materials: [material])
        
        entity.transform.translation = SIMD3<Float>(0, -0.1, -1)

        
        let anchor = AnchorEntity(plane: .vertical)

        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
    
    func placeRedSphere() {
        let box = MeshResource.generateSphere(radius: 0.1)
        let material = SimpleMaterial(color: .red, isMetallic: true)
        let entity = ModelEntity(mesh: box, materials: [material])
        
        entity.transform.translation = SIMD3<Float>(0, -0.1, -1)

        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
    
    func placeGreenCylinder() {
        let box = MeshResource.generateBox(width: 0.2, height: 0.2, depth: 0.2, cornerRadius: 0.1)
        let material = SimpleMaterial(color: .green, isMetallic: false)
        let entity = ModelEntity(mesh: box, materials: [material])
        
        entity.transform.translation = SIMD3<Float>(0, -0.1, -1)
        entity.transform.rotation = simd_quatf(angle: .pi/4, axis: SIMD3<Float>(0, 1, 0)) // Rotates the object by 45 degrees around the y-axis
        
        let anchor = AnchorEntity(world: .zero)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
    
    func placeYellowText() {
        let box = MeshResource.generateText("Welcome To AR")
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let entity = ModelEntity(mesh: box, materials: [material])
        
        entity.transform.translation = SIMD3<Float>(0, -0.1, -1)

        
        let anchor = AnchorEntity(world: .zero)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
    }
}
