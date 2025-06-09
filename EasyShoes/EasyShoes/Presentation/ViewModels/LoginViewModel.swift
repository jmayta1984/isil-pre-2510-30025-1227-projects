//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 9/06/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var state: UIState<User> = .idle

    @Published var username = "emilys"
    @Published var password = "emilyspass"
    
    func login() {
        state = .loading
        AuthService().login(username: username, password: password) { user, message  in
            DispatchQueue.main.async {
                if let user = user {
                    self.state = .success(user)
                } else {
                    self.state = .failure(message ?? "Unknow error")
                }
            }
        }
    }
}
