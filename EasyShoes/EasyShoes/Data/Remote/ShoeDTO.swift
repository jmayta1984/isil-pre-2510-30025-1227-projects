//
//  ShoeResponse.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

struct ShoeDTO: Identifiable, Decodable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
    let sizes: [ShoeSizeDTO]
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case brand
        case gender
        case category
        case price
        case image
        case sizes = "sizes_available"
        case description
    }
    
}

struct ShoeSizeDTO: Decodable {
    let size: Double
    let quantity: Int
    
    func toDomain() -> ShoeSize {
        ShoeSize(size: "\(size)", stock: quantity)
    }
}

extension ShoeDTO {
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, brand: brand.capitalizedFirstLetter(), gender: gender, category: category, price: price, image: image, description: description, sizes: sizes.map({ $0.toDomain() })
        )
    }
    
}
