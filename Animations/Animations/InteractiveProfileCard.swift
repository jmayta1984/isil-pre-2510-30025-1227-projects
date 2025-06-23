//
//  InteractiveProfileCard.swift
//  Animations
//
//  Created by Alumno on 23/06/25.
//

import SwiftUI

struct InteractiveProfileCard: View {
    @State private var expanded = false
    @State private var showIcon = false
    
    @GestureState private var draggOffset = CGSize.zero
    
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 10) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: expanded ? 100: 80, height: expanded ? 100 : 80)
                Text("Luis Pacheco")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                if expanded {
                    Text("Mobile expert")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundStyle(.white)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    
                }
                
                if showIcon {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .rotationEffect(.degrees(expanded ? 360 : 0))
                        .scaleEffect(1.2)
                        .transition(.scale)
                        .animation(.easeInOut(duration: 1), value: expanded)
                }
            }
            .padding()
            .frame(width: expanded ? 320 : 200, height: expanded ? 340 : 200)
            .background(expanded ? .purple : .blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .rotation3DEffect(.degrees(expanded ? 10 : 0), axis: (x: 0, y: 1, z: 0))
            .shadow(radius: 10)
            .offset(y: draggOffset.height)
            .gesture(
                DragGesture()
                    .updating($draggOffset, body: { value, state, _ in
                        if expanded && value.translation.height > 0 {
                            state = value.translation
                        }
                    }
                )
                    .onEnded { value in
                        if value.translation.height > 100 {
                            withAnimation(.spring()) {
                                expanded = false
                                showIcon = false
                            }
                        }
                    }
            )
            .onTapGesture {
                withAnimation(.spring()) {
                    expanded.toggle()
                    showIcon = expanded
                }
            }
            Spacer()
            
        }
    }
}

#Preview {
    InteractiveProfileCard()
}
