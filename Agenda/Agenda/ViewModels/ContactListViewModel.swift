//
//  ContactListViewModel.swift
//  Agenda
//
//  Created by Alumno on 21/04/25.
//

import Foundation

class ContactListViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    func saveContact(contact: Contact, editing: Bool) {
        if (editing) {
            updateContact(contact: contact)
        } else
        {
            addContact(contact: contact)
        }
        
    }
    
    private func addContact(contact: Contact) {
        contacts.append(contact)
    }
    
    private func updateContact(contact: Contact) {
        contacts =  contacts.map { it in
            it.id == contact.id ? contact : it
        }
    }
    
    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
    
}
