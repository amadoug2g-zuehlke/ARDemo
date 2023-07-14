//
//  USDZPlacementDisplayView.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 14.07.23.
//

import SwiftUI
import ARKit
import RealityKit

struct USDZFilePlacementView: View {
    @StateObject private var arView = USDZPlacementView()
    let items = [
        USDZItemPreview(title: "Meringue Pie", filePath: "pie_lemon_meringue"),
        USDZItemPreview(title: "Teapot", filePath: "teapot"),
        USDZItemPreview(title: "Robot Walk", filePath: "robot_walk_idle"),
        USDZItemPreview(title: "Toy Car", filePath: "toy_car"),
        USDZItemPreview(title: "Watering Can", filePath: "wateringcan")
    ]
    
    var body: some View {
        ZStack {
            USDZPlacementViewRep(arView: arView).ignoresSafeArea()
            
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer(minLength: 20)
                HStack(spacing: 20) {
                    ForEach(items) { item in
                        VStack {
                            ARPreviewView(fileName: item.filePath)
                                .frame(width: 120, height: 120)
                                .padding()
                                .onTapGesture {
                                    arView.configureAR(fileName: item.filePath)
                                }
                            
                            Text(item.title)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
}

struct ARPreviewView: UIViewRepresentable {
    let fileName: String
    
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let arView = uiView as? ARView {
            // Remove existing anchors from the scene
            arView.scene.anchors.removeAll()
            
            // Load and display the USDZ file
            let modelEntity = try! ModelEntity.load(named: fileName)
            let anchorEntity = AnchorEntity()
            anchorEntity.addChild(modelEntity)
            arView.scene.anchors.append(anchorEntity)
        }
    }
}


struct USDZFilePlacementView_Previews: PreviewProvider {static var previews: some View {USDZFilePlacementView()}
    
}

struct USDZItemPreview: Identifiable {
    let id = UUID()
    let title: String
    let filePath: String
}
