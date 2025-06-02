//
//  String+Extensions.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

extension String {
    
    func capitalizedFirstLetter() -> String {
        guard let first = self.first else { return self }
        return first.uppercased() + self.dropFirst().lowercased()
    }
}
