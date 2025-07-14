//
//  MovieListViewModel.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

import Foundation

class SearchMovieViewModel: ObservableObject {
    
    @Published var uiState: UIState<[Movie]> = .initialState
    @Published var query = ""
    
    func searchMovies() {
        
        uiState = .loadingState
        
        let movieService = MovieService.shared
        
        movieService.searchMovie(query: query) { movies, message in
            DispatchQueue.main.async {
                if let movies = movies {
                    self.uiState = .successState(movies)
                } else {
                    self.uiState = .failureState(message ?? "Error: Unknown error")
                }
            }
        }
    }
    
}
