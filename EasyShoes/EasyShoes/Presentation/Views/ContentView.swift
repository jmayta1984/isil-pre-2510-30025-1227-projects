//
//  ContentView.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "shoe") {
                HomeView()
            }
            
            Tab("Favorites", systemImage: "heart") {
                Text("Favorites")
            }
            
            Tab("Cart", systemImage: "cart") {
                Text("Cart")
            }
        }
        .tint(ColorPalette.primary)
    }
}

#Preview {
    ContentView()
}
