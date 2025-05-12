//
//  Product.swift
//  Inventory
//
//  Created by Alumno on 12/05/25.
//

import Foundation

struct Product: Identifiable {
    let id: UUID
    let name: String
    let quantity: Int
}
