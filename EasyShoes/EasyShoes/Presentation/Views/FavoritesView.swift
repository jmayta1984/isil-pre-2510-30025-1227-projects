//
//  FavoritesView.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

import SwiftUI

struct FavoritesView: View {
    
    let favorites = [
        FavoriteShoe(id: 1, name: "Adidas Samba", image: "https://wowconcept.com/cdn/shop/files/ADO2SNE01037LEW_Grey_0_cbb1300e-e3a4-4e17-b3c1-c9b052bdc3d5.png", price: 200),
        FavoriteShoe(id: 2, name: "Adidas Samba", image: "https://wowconcept.com/cdn/shop/files/ADO2SNE01037LEW_Grey_0_cbb1300e-e3a4-4e17-b3c1-c9b052bdc3d5.png", price: 200),
        FavoriteShoe(id: 3, name: "Adidas Samba", image: "https://wowconcept.com/cdn/shop/files/ADO2SNE01037LEW_Grey_0_cbb1300e-e3a4-4e17-b3c1-c9b052bdc3d5.png", price: 200),
        FavoriteShoe(id: 4, name: "Adidas Samba", image: "https://wowconcept.com/cdn/shop/files/ADO2SNE01037LEW_Grey_0_cbb1300e-e3a4-4e17-b3c1-c9b052bdc3d5.png", price: 200)
        
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(favorites) { favorite in
                    FavoriteShoeCardView(favorite: favorite)
                }
            }
        }
    }
    
    
}
