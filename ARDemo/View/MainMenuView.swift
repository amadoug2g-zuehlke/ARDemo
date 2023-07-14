//
//  MainMenuView.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 14.07.23.
//

import SwiftUI

struct MainMenuView: View {
    let options = [
        OptionCardData(title: "AR Object Display", iconName: "cube.fill", destination: AnyView(ARObjectDisplayView())),
        OptionCardData(title: "Bring Objects into AR", iconName: "camera.fill", destination: nil),
        OptionCardData(title: "Parametric 3D Room Scans", iconName: "house.fill", destination: nil),
        OptionCardData(title: "Manipulate USDZ Files", iconName: "wand.and.stars.inverse", destination: nil),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(options) { option in
                        NavigationLink(destination: {
                            if let destination = option.destination {
                                destination
                            } else {
                                Text("Feature not yet implemented")
                            }
                        }) {
                            OptionCard(option: option)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitle("ARDemo")
        }
    }
}

struct OptionCard: View {
    let option: OptionCardData

    var body: some View {
        HStack {
            Image(systemName: option.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding()
            Text(option.title)
                .font(.headline)
                .padding()
            
            Spacer()
        
            if option.destination != nil {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.green)
                    .frame(width: 20, height: 20)
                    .padding()
            } else {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(width: 20, height: 20)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct OptionCardData: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let destination: AnyView?
}




