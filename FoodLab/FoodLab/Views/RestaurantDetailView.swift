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
        ZStack (alignment: .bottom){
            
            GoogleMapView(
                latitude: restaurant.latitude,
                longitude: restaurant.longitude,
                zoom: 15,
                title: restaurant.title,
                subTitle: restaurant.address)
            
            VStack (spacing: 10){
                Text(restaurant.title)
                    .font(.title2)
                    .bold()
                Text(restaurant.address)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                HStack (spacing: 5) {
                    Image(systemName: "star.fill")
                    Text(String(format: "%.1f", restaurant.rating))
                        .font(.subheadline)
                }
                
                
                if showDetail {
                    AsyncImage(url: URL(string: restaurant.poster)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                        case .failure:
                            Color.gray
                                .frame(height: 200)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    Text(restaurant.description)
                        .font(.body)
                        .foregroundStyle(.primary)
                        .padding(.top, 5)
                }
                
                Button(showDetail ? "Hide" : "Show more") {
                    withAnimation {
                        showDetail.toggle()
                    }
                }
                .font(.subheadline)
                .foregroundStyle(.primary)
                .bold()
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            
            
        }
        .edgesIgnoringSafeArea(.all)

        
    }
}
