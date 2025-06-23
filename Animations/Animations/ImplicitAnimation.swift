//
//  ContentView.swift
//  Animations
//
//  Created by Alumno on 23/06/25.
//

import SwiftUI

struct ImpliciteAnimation: View {
    @State private var isBig = false
    
    
    var body: some View {
        
        
        Rectangle()
            .frame(width: isBig ? 200 : 100, height: isBig ? 200:100)
            .foregroundStyle(isBig ? .red : .blue)
            .rotationEffect(Angle(degrees: isBig ? 180 : 0))
            .animation(.bouncy(duration: 2), value: isBig)
            .onTapGesture {
                isBig.toggle()
            }
    }
}

#Preview {
    ContentView()
}
