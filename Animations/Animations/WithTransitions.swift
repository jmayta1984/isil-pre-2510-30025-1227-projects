//
//  WithTransitions.swift
//  Animations
//
//  Created by Alumno on 23/06/25.
//

import SwiftUI

struct WithTransitions: View {
    @State var showRectangle = false
    
    var body: some View {
        VStack (spacing: 20)
        {

            Button {
                withAnimation {
                    showRectangle.toggle()
                }
                
            } label: {
                Text("Animate")
            }
            if showRectangle {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut, value: showRectangle)
            }
            
            
        }
    }
}

#Preview {
    WithTransitions()
}
