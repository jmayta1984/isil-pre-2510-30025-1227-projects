//
//  FavoriteShoeCardViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

import Foundation

class FavoriteShoeCardViewModel: ObservableObject {
    let dao = FavoriteShoeDAO()
    
    func removeFavorite(id: Int) {
        dao.deleteFavorite(id: id)
    }
    
}
