//
//  UserDTO.swift
//  EasyShoes
//
//  Created by Alumno on 9/06/25.
//

import Foundation


struct UserDTO: Decodable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let image: String
    let email: String
    
    func toDomain() -> User {
        User(id: id, username: username, name: "\(firstName) \(lastName) ", image: image, email: email)
    }
}
