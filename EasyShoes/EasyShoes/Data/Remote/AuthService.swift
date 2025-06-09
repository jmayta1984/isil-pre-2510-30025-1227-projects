//
//  AuthService.swift
//  EasyShoes
//
//  Created by Alumno on 9/06/25.
//

import Foundation

class AuthService {
    let url = "https://dummyjson.com/auth/login"
    
    func login(username: String, password: String, completion: @escaping(User?, String?) -> Void ) {
        
        HttpRequestHelper().POST(url: url, body: UserRequestDTO(username: username, password: password)) { data, error in
            
            // Validar que no haya error
            guard error == nil else {
                completion(nil, error)
                return
                
            }
            
            // Validar que hay datos
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let userDTO = try JSONDecoder().decode(UserDTO.self, from: data)
                completion(userDTO.toDomain(), nil)
                
            } catch let decodingError {
                completion(nil, String(describing: decodingError))
            }
        }
        
    }
}
