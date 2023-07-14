//
//  USDZPlacementViewRep.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 14.07.23.
//

import SwiftUI

struct USDZPlacementViewRep: UIViewRepresentable {
    var arView: USDZPlacementView
    
    func makeUIView(context: Context) -> USDZPlacementView {
        return arView
    }
    
    func updateUIView(_ uiView: USDZPlacementView, context: Context) { }
}
