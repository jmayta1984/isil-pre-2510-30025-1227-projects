//
//  ContentView.swift
//  Animations
//
//  Created by Alumno on 23/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Implicit", systemImage: "rectangle") {
                ImpliciteAnimation()
            }
            
            Tab("Infinite", systemImage: "arrow.2.circlepath") {
                InfiniteRotation()
            }
            
            Tab("Transition", systemImage: "circle") {
                WithTransitions()
            }
            Tab("Matched", systemImage: "square.stack.3d.forward.dottedline") {
                MatchedGeometry()
            }
            
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
