//
//  MovieDTO.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

struct MoviesDTO: Decodable {
    
    let movies: [MoviesDTO]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let poster: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case overview
    }
    
    func toDomain() -> Movie {
        Movie(id: id,
              title: title,
              poster: "https://image.tmdb.org/t/p/w500\(poster)",
              overview: overview)
    }
}


