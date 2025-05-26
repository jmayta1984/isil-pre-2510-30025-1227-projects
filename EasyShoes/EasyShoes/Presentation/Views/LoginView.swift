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
            VStack (spacing: UIConstants.spacingDefault){
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(ColorPalette.background)
                    .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusSmall))
                SecureField("Password", text: $password)
                    .padding()
                    .background(ColorPalette.background)
                    .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusSmall))
                Button(action: {}) {
                    Text("Sign in")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(ColorPalette.primary)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusButton))
                
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
