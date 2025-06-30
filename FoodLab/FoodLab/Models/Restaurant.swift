//
//  restaurant.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

struct Restaurant: Identifiable, Hashable, Decodable {
    let id: Int
    let title: String
    let poster: String
    let latitude: Double
    let longitude: Double
    let address: String
    let phone: String
    let rating: Double
    let description: String
}
