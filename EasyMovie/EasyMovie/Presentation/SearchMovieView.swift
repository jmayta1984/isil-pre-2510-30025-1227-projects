//
//  SearchMovieView.swift
//  EasyMovie
//
//  Created by Alumno on 7/07/25.
//

import SwiftUI

struct SearchMovieView: View {
    @StateObject var viewModel = MovieListViewModel()
    @State var query = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search movie", text: $query)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onSubmit {
                        viewModel.searchMovies(query: query)
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
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            case .failureState:
                Spacer()
            }
        }
    }
}

#Preview {
    SearchMovieView()
}
