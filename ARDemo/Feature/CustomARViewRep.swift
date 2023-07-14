//
//  CustomARViewRep.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 12.07.23.
//

import SwiftUI

struct CustomARViewRep: UIViewRepresentable {
    var arView: CustomARView
    
    func makeUIView(context: Context) -> CustomARView {
        return arView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) { }
}
