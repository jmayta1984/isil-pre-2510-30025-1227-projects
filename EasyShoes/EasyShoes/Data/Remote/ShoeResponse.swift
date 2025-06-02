//
//  ShoeResponse.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

struct ShoeResponse: Identifiable, Decodable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
    let sizes: [ShoeSizeResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case brand
        case gender
        case category
        case price
        case image
        case sizes = "sizes_available"
    }
    
}

struct ShoeSizeResponse: Decodable {
    let size: Int
    let quantity: Int
}
