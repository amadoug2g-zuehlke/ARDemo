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
    
    var body: some View {
        ZStack {
            USDZPlacementViewRep(arView: arView)
                    .ignoresSafeArea()
        }
    }
}
