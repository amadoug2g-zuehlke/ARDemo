//
//  CustomARViewRep.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 12.07.23.
//

import SwiftUI

struct ARObjectViewRep: UIViewRepresentable {
    var arView: ARObjectView
    
    func makeUIView(context: Context) -> ARObjectView {
        return arView
    }
    
    func updateUIView(_ uiView: ARObjectView, context: Context) { }
}
