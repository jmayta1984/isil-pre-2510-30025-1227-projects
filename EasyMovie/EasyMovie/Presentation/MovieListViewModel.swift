//
//  MovieListViewModel.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var uiState: UIState<[Movie]> = .initialState
    
    func searchMovies(query: String) {
        
        uiState = .loadingState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .successState([
                Movie(id: 414906, title: "The Batman", poster: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg", overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.")
            ])
        }
    }
    
}
