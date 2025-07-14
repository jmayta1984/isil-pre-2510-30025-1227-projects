//
//  ContentView.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Search", systemImage: "magnifyingglass") {
                SearchMovieView()
            }
            Tab("Favorites", systemImage: "heart") {
                
            }
        }
        .tint(.black)
      
    }
}

#Preview {
    ContentView()
}
