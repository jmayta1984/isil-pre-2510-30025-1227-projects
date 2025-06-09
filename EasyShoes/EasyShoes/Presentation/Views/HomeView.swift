//
//  HomeView.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    
    let genders = ["All", "Men", "Women", "Kids"]
    @State var selectedGender = "All"
    @StateObject var viewModel = HomeViewModel()
    
    @State var selectedShoe: Shoe? = nil
    
    var body: some View {
        ScrollView {
            VStack (spacing: UIConstants.spacingDefault){
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray )
                    TextField("Search", text: $search)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                .padding()
                .background(ColorPalette.background)
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusSmall))
                
                Banner()
                
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender)
                                .padding(.horizontal, UIConstants.paddingLarge)
                                .padding(.vertical, UIConstants.paddingDefault)
                                .background(gender == selectedGender ? ColorPalette.primary : .white)
                                .foregroundStyle(gender == selectedGender ? .white : .gray)
                                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusDefault))
                                .overlay {
                                    RoundedRectangle(cornerRadius: UIConstants.cornerRadiusDefault)
                                        .stroke(gender == selectedGender ? ColorPalette.primary : .gray, lineWidth: 1)
                                }
                                .onTapGesture {
                                    selectedGender = gender
                                }
                        }
                    }
                }
           
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView("Loading")
                case .success(let shoes):
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(shoes) { shoe in
                            ShoeCardView(shoe: shoe)
                                .onTapGesture {
                                    selectedShoe = shoe
                                }
                        }
                    }
                case .failure(let message):
                    VStack {
                        Text("Error: \(message)")
                    }
                }
                    
                
            }
            .padding(UIConstants.paddingDefault)
            .sheet(item: $selectedShoe) { shoe in
                ShoeDetailView(shoe: shoe)
            }

        }
    
    }
}

#Preview {
    HomeView()
}
