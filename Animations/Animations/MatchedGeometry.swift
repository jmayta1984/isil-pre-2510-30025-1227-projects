//
//  MatchedGeometry.swift
//  Animations
//
//  Created by Alumno on 23/06/25.
//

import SwiftUI

struct MatchedGeometry: View {
    @Namespace private var namespace
    
    @State private var expanded = false
    var body: some View {
        VStack {
            Text("Matched geometry")
                .font(.headline)
            Spacer()
            if expanded {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "box", in: namespace)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "box", in: namespace)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.purple)
            }
            Spacer()
            Button {
                withAnimation(.spring) {
                    expanded.toggle()
                }
            } label: {
                Text("Chage size")
            }

        }
        
    }
}

#Preview {
    MatchedGeometry()
}
