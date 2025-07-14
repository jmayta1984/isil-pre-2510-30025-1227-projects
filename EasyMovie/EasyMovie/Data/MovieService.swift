//
//  MovieService.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

import Foundation

class MovieService {
    
    static let shared = MovieService()
    
    private init() {}
    
    let url = "https://api.themoviedb.org/3/search/movie?api_key=0fb2259dc60130bd85acb07069f8bb0d&query="
    
    func searchMovie(query: String, completion: @escaping([Movie]?, String?) -> Void) {
        
        guard let url = URL(string:  "\(url)\(query) " ) else {
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil, "Error: \(error?.localizedDescription ?? "Unkwown error")")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: HTTPRequest failed")
                return
            }
            
            do {
                let moviesDTO = try JSONDecoder().decode(MoviesDTO.self, from: data)
                let dtos = moviesDTO.movies
                let movies = dtos.map({$0.toDomain()})
                completion(movies, nil)
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
    }
}
