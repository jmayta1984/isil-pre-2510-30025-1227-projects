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
    
    var body: some View {
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
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(genders, id: \.self) { gender in
                    Text(gender)
                }
            }
                
            Spacer()
            
        }
        .padding(UIConstants.paddingDefault)
        
        
        
    }
}

#Preview {
    HomeView()
}
