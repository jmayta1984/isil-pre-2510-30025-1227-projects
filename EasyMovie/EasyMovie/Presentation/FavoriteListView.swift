//
//  FavoriteListView.swift
//  EasyMovie
//
//  Created by Alumno on 14/07/25.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        VStack {
            List{
                ForEach(viewModel.favorites) { favorite in
                    FavoriteListItemView(favorite: favorite)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        .listRowSeparator(.hidden)
                    
                }
                .onDelete { indexSet in
                    viewModel.deleteFavorite(indexSet: indexSet)
                }
            }
            .listStyle(.plain)
        }.onAppear{
            viewModel.getFavorites()
        }
    }
}
