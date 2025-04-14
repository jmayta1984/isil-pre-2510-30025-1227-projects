//
//  ContactForm.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import SwiftUI

struct ContactForm: View {
    
    
    @State private var name = ""
    @State private var email = ""
    @State private var isSuscribed = false
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
                TextField("Email", text: $email)
            }
            
            Section {
                Toggle("Suscribe", isOn: $isSuscribed)
                
                
            }
        }
    }
}

#Preview {
    ContactForm()
}
