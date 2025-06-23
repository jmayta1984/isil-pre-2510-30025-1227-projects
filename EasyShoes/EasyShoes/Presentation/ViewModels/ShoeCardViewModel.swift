//
//  ShoeCardViewMode;.swift
//  EasyShoes
//
//  Created by Alumno on 23/06/25.
//

import Foundation

class ShoeCardViewModel: ObservableObject {
    @Published var isFavorite: Bool = false
    private let dao = FavoriteShoeDAO.shared
    
    
    func checkFavorite(id: Int) {
        isFavorite = dao.checkFavorite(id: id)
    }
    
    func toggleFavorite(shoe: Shoe) {
        isFavorite.toggle()
        
        if (isFavorite) {
            addFavorite(shoe: shoe)
        } else {
            removeFavorite(id: shoe.id)
        }
    }
    
    private func removeFavorite(id: Int) {
        dao.deleteFavorite(id: id)
    }
    
    private func addFavorite(shoe: Shoe) {
        
        dao.insertFavorite(favorite: FavoriteShoe(id: shoe.id, name: shoe.name, image: shoe.image, price: shoe.price))
    }
    
}
