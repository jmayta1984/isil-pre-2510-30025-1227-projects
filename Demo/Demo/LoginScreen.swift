//
//  LoginScreen.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var username = ""
    @State private var password = ""
    
    @State private var isVisible = false
    
    var body: some View {
        VStack (spacing: 16){
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ZStack (alignment: .trailing) {
                Group {
                    if isVisible {
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                           
                    } else {
                        SecureField("Password", text: $password)
                           
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye" :"eye.slash")
                    
                }
            }
           
            
            
            Button(action: {
                
            }) {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {
            }) {
                Text("Sign up")
                
            }
            
            
        }
        .padding()
    }
}

#Preview {
    LoginScreen()
}
