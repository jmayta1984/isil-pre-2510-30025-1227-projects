//
//  RestaurantListViewModel.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

/*
 {
 "id": 1,
 "title": "Osaka",
 "poster": "https://media-cdn.tripadvisor.com/media/photo-s/15/9d/92/de/iluminacion-calida-influencia.jpg",
 "latitude": -12.121945,
 "longitude": -77.0305,
 "address": "Av. El Sol 190, Miraflores 15074, Lima, Perú",
 "phone": "+51 1 2220405",
 "website": "https://osaka.com.pe",
 "rating": 4.7,
 "description": "Osaka Miraflores ofrece una fusión única de cocina japonesa y peruana, conocida como Nikkei. Con un ambiente moderno y sofisticado, es famoso por sus deliciosos makis, sashimis y platos innovadores."
 }
 */
import Foundation

class RestaurantListViewModel: ObservableObject {
    @Published var uiState: UIState<[Restaurant]> = .initialState
    private let restaurantService = RestaurantService()
    
    func getAllRestaurants() {
        uiState = .loadingState
        
        self.restaurantService.getAllRestaurants { restaurants, _ in
            DispatchQueue.main.async {
                if let restaurants = restaurants {
                    self.uiState = .successState(restaurants)
                }
            }
           
        }
    
    }
    
}
