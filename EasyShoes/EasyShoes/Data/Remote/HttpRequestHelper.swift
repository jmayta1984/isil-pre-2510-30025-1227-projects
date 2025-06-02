//
//  HttpRequestHelper.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

import Foundation

class HttpRequestHelper {
    
    func GET(url: String) {
        
        //  Validar que la url sea válida
        guard let url = URL(string: url) else {
            return
        }
        
        // Crear una solicitud
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // Crear una sesión
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            
        }
        .resume()
    }
}

