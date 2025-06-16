//
//  FavoriteShoeEntity+Extensions.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

extension FavoriteShoeEntity {
    
    func fromDomain(favorite: FavoriteShoe) {
        self.id = Int16(favorite.id)
        self.name = favorite.name
        self.image = favorite.image
        self.price = Int16(favorite.price)
    }
    
    func toDomain() -> FavoriteShoe {
        FavoriteShoe(id: Int(id), name: name ?? "", image: image ?? "", price: Int(price))
    }
}
