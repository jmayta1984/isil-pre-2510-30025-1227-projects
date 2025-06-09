//
//  ShoeService.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

import Foundation

class ShoeService {
    
    let url = "https://sugary-wool-penguin.glitch.me/shoes"
    
    func getShoes(completion: @escaping ([Shoe]?, String?) -> Void) {
        HttpRequestHelper().GET(url: url) { data, error in
            
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
                let shoes = try JSONDecoder().decode([ShoeDTO].self, from: data).map { shoeResponse in
                    shoeResponse.toDomain()
                }
                completion(shoes, nil)
                
            } catch let decodingError {
                completion(nil, String(describing: decodingError))
            }
        }
    }
    
}
