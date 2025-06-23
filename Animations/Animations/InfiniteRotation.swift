//
//  InfiniteRotation.swift
//  Animations
//
//  Created by Alumno on 23/06/25.
//

import SwiftUI

struct InfiniteRotation: View {
    @State var rotate = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Infinite animation")
                .font(.headline)
            
            Image(systemName:  "arrow.2.circlepath")
                .resizable()
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotate)
                .onAppear{
                    rotate = true
                }
            
            
        }
    }
}

#Preview {
    InfiniteRotation()
}
