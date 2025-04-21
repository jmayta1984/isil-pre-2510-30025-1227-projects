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
    
    @ObservedObject var viewModel: ContactListViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("Information")) {
                    TextField("Name", text: $name)
                    TextField("Phone", text: $phone)
                    TextField("Company", text: $company)
                    
                }
            }
            .navigationTitle(Text("New contact"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        let contact = Contact(name: name, phone: phone, company: company)
                        viewModel.addContact(contact: contact)
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
