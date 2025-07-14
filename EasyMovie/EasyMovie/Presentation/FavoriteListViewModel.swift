//
//  FavoriteListViewModel.swift
//  EasyMovie
//
//  Created by Alumno on 14/07/25.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites = [Favorite]()
    let dao = FavoriteDAO.shared
    
    
    func getFavorites() {
        
        favorites = dao.fetchAll()
        
    }
    
    func deleteFavorite(indexSet: IndexSet){
        
        if let index = indexSet.first {
            dao.deleteFavorite(id: favorites[index].id)
        }
        favorites.remove(atOffsets: indexSet)
    }
    
  
}
