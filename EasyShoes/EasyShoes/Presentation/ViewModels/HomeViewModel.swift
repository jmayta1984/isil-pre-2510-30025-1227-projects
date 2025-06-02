//
//  HomeViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var shoes = [
        Shoe(id: 1, name: "Adidas Samba", brand: "Adidas", gender: "", category: "", price: 200, image: "https://www.hustgt.com/cdn/shop/products/Tenis_Samba_OG_Blanco_BB6975_01_standard-removebg--triangle.png"),
        Shoe(id: 2, name: "Adidas Samba", brand: "Adidas", gender: "", category: "", price: 200, image: "https://www.hustgt.com/cdn/shop/products/Tenis_Samba_OG_Blanco_BB6975_01_standard-removebg--triangle.png"),
        Shoe(id: 3, name: "Adidas Samba", brand: "Adidas", gender: "", category: "", price: 200, image: "https://www.hustgt.com/cdn/shop/products/Tenis_Samba_OG_Blanco_BB6975_01_standard-removebg--triangle.png"),
        Shoe(id: 4, name: "Adidas Samba", brand: "Adidas", gender: "", category: "", price: 200, image: "https://www.hustgt.com/cdn/shop/products/Tenis_Samba_OG_Blanco_BB6975_01_standard-removebg--triangle.png"),
        Shoe(id: 5, name: "Adidas Samba", brand: "Adidas", gender: "", category: "", price: 200, image: "https://www.hustgt.com/cdn/shop/products/Tenis_Samba_OG_Blanco_BB6975_01_standard-removebg--triangle.png")
    ]
    
    
}
