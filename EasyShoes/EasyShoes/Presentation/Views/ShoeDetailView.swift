//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by Alumno on 9/06/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    
    @State var selectedSize: ShoeSize? = nil
    @StateObject var viewModel = ShoeDetailViewModel()
    
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
                    viewModel.toggleFavorite(shoe: shoe)
                    print(viewModel.isFavorite)
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
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
                    .font(.headline)
                    .bold()
            }
            
            Text(shoe.brand)
                .font(.subheadline)
            
            Text(shoe.description)
                .font(.subheadline)

            Text("Sizes")
                .font(.headline)
                .bold()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(shoe.sizes, id: \.self.size) { size in
                        Text(size.size)
                            .font(.subheadline)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(size == selectedSize ? .white : .gray)
                            .background(size == selectedSize ? Color.brandPrimary : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .onTapGesture {
                                selectedSize = size
                            }
                    }
                }
            }
            
            if let size = selectedSize {
                Text("Stock: \(size.stock) ")
                    .font(.caption)

            }
            
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
        .onAppear {
            viewModel.checkFavorite(id: shoe.id)
        }
        .padding()
        
    }
        

}
