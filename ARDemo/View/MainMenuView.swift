//
//  MainMenuView.swift
//  ARDemo
//
//  Created by Amadougaye Cisse on 14.07.23.
//

import SwiftUI

struct MainMenuView: View {
    let options = [
        OptionCardData(title: "AR Object Display", iconName: "cube.fill"),
        OptionCardData(title: "Bring Objects into AR", iconName: "camera.fill"),
        OptionCardData(title: "Parametric 3D Room Scans", iconName: "house.fill"),
        OptionCardData(title: "Manipulate USDZ Files", iconName: "wand.and.stars.inverse")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(options) { option in
                        OptionCard(option: option)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
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
}



