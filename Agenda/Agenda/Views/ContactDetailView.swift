//
//  ContactDetailView.swift
//  Agenda
//
//  Created by Alumno on 21/04/25.
//
import SwiftUI

struct ContactDetailView: View {
    
    @State var name = ""
    @State var phone = ""
    @State var company = ""
    @Environment(\.dismiss) var dismiss
    
    var editingContact: Contact?
    
    var title: String {
        editingContact == nil ? "New contact" : "Edit contact"
    }
    
    @ObservedObject var viewModel: ContactListViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section  {
                    TextField("Name", text: $name)
                    TextField("Phone", text: $phone)
                    TextField("Company", text: $company)
                    
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        let id = editingContact?.id ?? UUID()
                        let contact = Contact(id: id,
                                              name: name,
                                              phone: phone,
                                              company: company)
                        
                        viewModel.saveContact(contact: contact, editing: editingContact != nil)
                        
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .onAppear{
                if let contact = editingContact {
                    name = contact.name
                    phone = contact.phone
                    company = contact.company
                }
            }
        }
    }
}

#Preview {
    ContactDetailView(viewModel: ContactListViewModel())
}
