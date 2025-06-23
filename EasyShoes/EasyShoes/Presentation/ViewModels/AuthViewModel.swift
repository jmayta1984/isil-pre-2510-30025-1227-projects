//
//  AuthViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 23/06/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published private(set) var user: User? = nil
    
    func login(user: User) {
        self.user = user
    }
    
    func logout() {
        self.user = nil
    }
    
}
