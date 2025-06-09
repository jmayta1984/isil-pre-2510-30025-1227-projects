//
//  LoginView.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    @State var user: User? = nil
    @State var alertMessage = ""
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                .disabled(viewModel.state == .loading)
                if case .loading = viewModel.state {
                    ProgressView()
                }
                
            }
            .padding()
            .onChange(of: viewModel.state) { oldValue, newValue in
                switch newValue {
                
                case .success(let user):
                    self.user = user
                case .failure(let message):
                    self.alertMessage = message
                    self.showAlert = true
                default:
                    break
                }
            }
            .alert("Error", isPresented: $showAlert, actions: {
                Button("OK", role: .cancel) {}
            }, message: {
                Text(alertMessage)
            })
            .navigationDestination(item: $user) { user in
                ContentView(user: user)
            }
        }
    }
}

#Preview {
    LoginView()
}
