//
//  LoginView.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack (spacing: UIConstants.spacingDefault){
                TextField("Username", text: $viewModel.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(ColorPalette.background)
                    .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusSmall))
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(ColorPalette.background)
                    .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusSmall))
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Sign in")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ColorPalette.primary)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusButton))
                }
                
                
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
