//
//  FoodLabApp.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI

@main
struct FoodLabApp: App {
    private let helper = GoogleMapHelper.shared
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
}
