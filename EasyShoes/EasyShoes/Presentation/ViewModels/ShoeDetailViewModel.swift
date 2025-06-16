//
//  ShoeDetailViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

import Foundation
class ShoeDetailViewModel: ObservableObject {
    let dao = FavoriteShoeDAO()
    @Published var isFavorite = false
    
    func checkFavorite(id: Int) {
        
        isFavorite = dao.checkFavorite(id: id)
        print(isFavorite)
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
