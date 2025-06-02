//
//  HttpRequestHelper.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

import Foundation

class HttpRequestHelper {
    
    func GET(url: String, completion: @escaping (Data?, String?) -> Void  ) {
        
        //  Validar que la url sea válida
        guard let url = URL(string: url) else {
            completion(nil, "Error: cannot create URL")
            return
        }
        
        // Crear una solicitud
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // Crear una sesión
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            
            // Validar que no haya error
            guard error == nil else {
                completion(nil, "Error: problem calling GET")
                return
            }
            
            // Validar que hay datos
            guard let data = data else {
                completion(nil, "Error: no data")
                return
            }
            
            // Validar que la respuesta sea success (200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(data, "Error: HTTP request failed")
                return
            }
            completion(data, nil)
            
            
        }
        .resume()
    }
}

