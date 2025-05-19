//
//  ProductDetailView.swift
//  Inventory
//
//  Created by Alumno on 12/05/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel = ProductDetailViewModel()
    @Environment(\.dismiss) var dismiss
    var selectedProduct: Product?
    var title: String {
        selectedProduct == nil ? "New product" : "Update product"
    }
    
    var onSave: (Product) -> Void
    

    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                        
                    
                    TextField("Quantity", text: $viewModel.quantity)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Button(action: {
                        if let product = viewModel.validate(id: selectedProduct?.id) {
                            onSave(product)
                            dismiss()
                        }
                    }) {
                        Text("Save")
                    }
                }
                Group {
                    if let error = viewModel.errorMessage {
                        Text(error).foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle(title)
            .onAppear {
                viewModel.loadData(product: selectedProduct)
            }
        }
    }
}

#Preview {
    ProductDetailView { _ in}
}
