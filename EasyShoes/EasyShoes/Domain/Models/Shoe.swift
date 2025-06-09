//
//  Shoe.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//


struct Shoe: Identifiable, Equatable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
    let description: String
    let sizes: [ShoeSize]
}

struct ShoeSize: Equatable {
    let size: String
    let stock: Int
}

