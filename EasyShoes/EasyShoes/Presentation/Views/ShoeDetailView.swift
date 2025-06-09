//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by Alumno on 9/06/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    var body: some View {
        VStack (alignment:.leading, spacing: UIConstants.spacingSmall){
            ZStack (alignment: .topTrailing){
                AsyncImage(url: URL(string: shoe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 240)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .frame(height: 240)
                        .frame(maxWidth: .infinity)
                }
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                }

            }

            
            HStack {
                Text(shoe.name)
                    .lineLimit(1)
                    .font(.headline)
                    .bold()
                Spacer()
                Text(String(format: "$ %i", shoe.price))
                    .font(.title3)
                    .bold()
            }
            
            Text(shoe.brand)
                .font(.subheadline)
            

            Spacer()
            Button {
                
            } label: {
                Text("Add to cart")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(ColorPalette.primary)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .padding()

    }
}
