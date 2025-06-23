//
//  HomeViewModel.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var state: UIState<[Shoe]> = .idle
    private let shoeService = ShoeService()
    
    init(){
        getShoes()
    }
    
    func getShoes() {
        self.state = .loading
        
        shoeService.getShoes { data, message in
            
            DispatchQueue.main.async {
                if let data = data {
                    self.state = .success(data)
                } else {
                    self.state = .failure(message ?? "Unknown error")
                }
            }
            
        }
        
    }
    
 
    
    
}
