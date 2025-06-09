//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 9/06/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var state: UIState<User> = .idle
    
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        state = .loading
        
        
    }
    
}
