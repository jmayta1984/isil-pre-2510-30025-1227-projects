//
//  RestaurantService.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import Foundation

class RestaurantService {
    
    private let urlString = "https://sugary-wool-penguin.glitch.me/restaurants"
    
    func getAllRestaurants(completion: @escaping([Restaurant]?, String?) -> Void) {
        
        let url = URL(string: urlString)
        
        guard let url = url else {
            completion(nil, "Cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil, "HTTP request failed")
                return
            }
            
            guard let data = data else {
                completion(nil, "No data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil , "Invalid response")
                return
            }
            
            do {
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                completion(restaurants, nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }.resume()
    }
}
