//
//  RestaurnatListItemView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI

struct RestaurantListItemView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: restaurant.poster)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack (alignment: .leading){
                Text(restaurant.title)
                    .bold()
                Text(restaurant.description)
                    .lineLimit(1)
                    .font(.subheadline)
            }
        }
    }
}
