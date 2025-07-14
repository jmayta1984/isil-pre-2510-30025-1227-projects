//
//  FavoriteListItemView.swift
//  EasyMovie
//
//  Created by Alumno on 14/07/25.
//

import SwiftUI

struct FavoriteListItemView: View {
    let favorite: Favorite
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: favorite.poster)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 160)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 120, height: 160)
                case .failure:
                    Color.gray
                        .frame(width: 120, height: 160)
                    
                @unknown default:
                    EmptyView()
                }
            }
            VStack (alignment: .leading){
                Text(favorite.title)
                    .font(.headline)
            }
            .padding(.vertical)
        }
    }
}
