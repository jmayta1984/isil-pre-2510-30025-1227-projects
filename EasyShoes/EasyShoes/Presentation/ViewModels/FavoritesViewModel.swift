//
//  FavoritesViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites = [FavoriteShoe]()
    private let dao = FavoriteShoeDAO.shared
    
    func getAllFavorites() {
        favorites = dao.fetchAllFavorites()
    }
}
