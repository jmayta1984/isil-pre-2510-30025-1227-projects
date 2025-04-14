//
//  SwiftUIView.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        
        VStack (spacing: 16){
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
            
            Text("Luis Guillermo")
                .font(.title)
                .bold()
            
            Text("Docente a tiempo parcial")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(radius: 8)
    }
}

#Preview {
    ProfileCard()
}
