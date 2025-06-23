//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    
    @StateObject var viewModel = ShoeCardViewModel()
        
    var body: some View {
        VStack (alignment:.leading, spacing: UIConstants.spacingSmall){
            AsyncImage(url: URL(string: shoe.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIConstants.imageSizeSmall)
            } placeholder: {
                ProgressView()
                    .frame(height: UIConstants.imageSizeSmall)
            }
            
            Text(shoe.name)
                .lineLimit(1)
                .font(.headline)
                .bold()
            
            Text(shoe.brand)
                .font(.subheadline)
            
            HStack {
                Text(String(format: "$ %i", shoe.price))
                    .font(.title3)
                    .bold()
                Spacer()
                Button {
                    viewModel.toggleFavorite(shoe: shoe)
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                        .foregroundStyle(ColorPalette.primary)
                }

            }
            
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusCard))
        .overlay {
            RoundedRectangle(cornerRadius: UIConstants.cornerRadiusCard)
                .stroke(lineWidth: 2)
                .foregroundStyle(ColorPalette.background)
        }
        .onAppear {
            viewModel.checkFavorite(id: shoe.id)
        }
    }
}
