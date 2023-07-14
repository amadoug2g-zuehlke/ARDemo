//
//  ARObjectDisplayView.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 14.07.23.
//

import SwiftUI

struct ARObjectDisplayView: View {
    @StateObject private var arView = ARObjectView()
    
    var body: some View {
        ZStack {
            ARObjectViewRep(arView: arView)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {
                        arView.placeBlueBlock()
                    }) {
                        HStack {
                            Image(systemName: "cube.fill")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        arView.placeGreenCylinder()
                    }) {
                        HStack {
                            Image(systemName: "cylinder.fill")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        arView.placeRedSphere()
                    }) {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        arView.placeYellowText()
                    }) {
                        HStack {
                            Image(systemName: "character")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .offset(y: -30)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
    }
}

