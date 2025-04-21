//
//  ContactListView.swift
//  Agenda
//
//  Created by Alumno on 21/04/25.
//

import SwiftUI

struct ContactListView: View {
    @StateObject private var viewModel = ContactListViewModel()
    
    @State private var showContactDetail = false
    
    @State private var selectedContact: Contact? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.contacts) { contact in
                    Text(contact.name)
                        .onTapGesture {
                            selectedContact = contact
                            showContactDetail = true
                        }
                }
                .onDelete { indexSet in
                    viewModel.deleteContact(at: indexSet)
                }
                
                
            }
            .navigationTitle(Text("Agenda"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showContactDetail = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showContactDetail) {
                ContactDetailView(
                    editingContact: selectedContact,
                    viewModel: viewModel
                )
            }
        }
    }
}

#Preview {
    ContactListView()
}
