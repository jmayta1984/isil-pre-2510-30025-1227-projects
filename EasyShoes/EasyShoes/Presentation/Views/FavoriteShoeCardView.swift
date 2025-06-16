//
//  FavoriteShoeCardView.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

import SwiftUI

struct FavoriteShoeCardView: View {
    @State var showSizes = false
    @State var showOptions = false
    
    @StateObject var viewModel = FavoriteShoeCardViewModel()
    
    let favorite: FavoriteShoe
    let onDelete: () -> Void

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: favorite.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 100)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 100)
                case .failure(let error):
                    Text(error.localizedDescription)
                        .frame(width: 120, height: 100)
                @unknown default:
                    EmptyView()
                        .frame(width: 120, height: 100)
                }
            }
            
            VStack(alignment: .leading) {
                Text(favorite.name).font(.subheadline).bold().lineLimit(1)
                Text("$ \(favorite.price)").font(.subheadline)
                Button {
                    showSizes = true
                } label: {
                    HStack {
                        Image(systemName: "cart")
                        Text("Add to cart")
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black, lineWidth: 1)
                    }
                }
                .buttonStyle(.borderless)
                .foregroundStyle(.black)

            }
            
            Spacer()
            
            Button {
                showOptions = true
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .rotationEffect(Angle(degrees: 90))
            }
            .buttonStyle(.borderless)
            .foregroundStyle(.black)

        }
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))

        .sheet(isPresented: $showOptions) {
            VStack (alignment: .leading, spacing: 20){
                Text("Options").font(.headline)
                Button {
                    showOptions = false
                    showSizes = true
                    
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.black)
                }
                
                Button {
                    viewModel.removeFavorite(id: favorite.id)
                    showOptions = false
                    onDelete()
                } label: {
                    Label("Remove from favorites", systemImage: "trash")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.black)
                }

                Spacer()
            }
            .presentationDetents([.height(150)])
            .padding()
            
        }
        
        .sheet(isPresented: $showSizes) {
            VStack (alignment: .leading, spacing: 20){
                Text("Sizes").font(.headline)
                
                Button(action: {
              
                }) {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ColorPalette.primary)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusButton))
                }

                Spacer()
            }
            .presentationDetents([.height(150)])
            .padding()
            
        }
    }
}
