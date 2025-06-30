//
//  RestaurantDetailView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    @State var showDetail = false
    
    var body: some View {
        VStack {
            GoogleMapView(latitude: restaurant.latitude, longitude: restaurant.longitude, zoom: 15, title: restaurant.title, subTitle: restaurant.address)
         
            
        }
        .onAppear {
            showDetail = true
        }
        .sheet(isPresented: $showDetail) {
            VStack {
                AsyncImage(url: URL(string: restaurant.poster)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                        
                    case .failure(let error):
                        Text(error.localizedDescription)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .presentationDetents([.height(120)])
        
        }
        
    }
}
