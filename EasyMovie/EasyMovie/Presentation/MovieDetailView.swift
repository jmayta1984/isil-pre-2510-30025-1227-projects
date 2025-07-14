//
//  MovieDetailView.swift
//  EasyMovie
//
//  Created by Alumno on 14/07/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    @State var isFavorite = false
    @EnvironmentObject var viewModel: SearchMovieViewModel
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing){
                AsyncImage(url: URL(string: movie.poster)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                    case .failure:
                        Color.gray
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)

                    @unknown default:
                        EmptyView()
                    }
                }
                Button {
                    viewModel.toggleFavorite(movie: movie)
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    
                }
                .padding(12)
                .background(.white)
                .clipShape(Circle())
                .padding()

            }
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .font(.subheadline)
            }
            .padding()
           
            Spacer()
        }
        .onAppear {
            isFavorite = viewModel.isFavorite(id: movie.id)
            
        }
    }
}
