//
//  ContentView.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct ContentView: View {
    let user: User
    var body: some View {
        TabView {
            Tab("Home", systemImage: "shoe") {
                HomeView()
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesView()
            }
            
            Tab("Cart", systemImage: "cart") {
                Text("Cart")
            }
        }
        .tint(ColorPalette.primary)
        .navigationTitle("EasyShoes")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text(user.name).font(.caption)
                    AsyncImage(url: URL(string: user.image)) { image in
                        image
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .frame(width: 20, height: 20)
                    }
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundStyle(ColorPalette.primary)
                    }
                }
                
            }
        }
    }
}
