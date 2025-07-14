//
//  SearchMovieView.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

import SwiftUI

struct SearchMovieView: View {
    @StateObject var viewModel = SearchMovieViewModel()

    @State var selectedMovie: Movie? = nil
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search movie", text: $viewModel.query)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onSubmit {
                        viewModel.searchMovies()
                    }
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            switch viewModel.uiState {
            case .initialState:
                
                Spacer()
                
            case .loadingState:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
            case .successState(let movies):
                List {
                    ForEach(movies) { movie in
                        MovieListItemView(movie: movie)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                selectedMovie = movie
                            }
                    }
                }
                .listStyle(.plain)
            case .failureState(let message):
                VStack {
                    Spacer()
                    Text(message)
                    Spacer()
                }
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        .sheet(item: $selectedMovie) { movie in
            MovieDetailView(movie: movie)
        }
    }
}

#Preview {
    SearchMovieView()
}
