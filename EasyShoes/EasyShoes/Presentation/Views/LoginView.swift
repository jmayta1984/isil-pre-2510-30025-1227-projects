//
//  LoginView.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 16){
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(ColorPalette.background)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                SecureField("Password", text: $password)
                    .padding()
                    .background(ColorPalette.background)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Button(action: {}) {
                    Text("Sign in")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(ColorPalette.primary)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                
                Button(action: {}) {
                    Text("Sign up")
                }
                .foregroundStyle(ColorPalette.primary)
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
