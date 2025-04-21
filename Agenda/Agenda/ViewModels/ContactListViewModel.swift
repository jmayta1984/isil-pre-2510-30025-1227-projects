//
//  ContactListViewModel.swift
//  Agenda
//
//  Created by Alumno on 21/04/25.
//

import Foundation

class ContactListViewModel: ObservableObject {
    //@Published var contacts = [Contact]()
    @Published var contacts = [Contact(name: "Luis", phone: "123", company: "ISIL")]
    func addContact(contact: Contact) {
        contacts.append(contact)
    }
    
    func updateContact() {
        
    }
    
    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
    
}
