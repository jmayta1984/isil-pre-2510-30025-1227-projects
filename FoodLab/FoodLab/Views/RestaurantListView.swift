//
//  RestaurantListView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantListViewModel()
    @State var selectedRestaurant: Restaurant? = nil
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.uiState {
                case .initialState, .loadingState:
                    ProgressView()
                case .successState(let restaurants):
                    List {
                        ForEach (restaurants) { restaurant in
                            RestaurantListItemView(restaurant: restaurant)
                                .onTapGesture {
                                    selectedRestaurant = restaurant
                                }
                        }
                    }
                    .listStyle(.plain)
                case .failureState(let message):
                    Text(message)
                }
            }
            .navigationDestination(item: $selectedRestaurant) { restaurant in
                RestaurantDetailView(restaurant: restaurant)
            }
        }
        .onAppear {
            viewModel.getAllRestaurants()
        }
    }
}

#Preview {
    RestaurantListView()
}
