//
//  TaskDetailView.swift
//  ToDo
//
//  Created by Alumno on 5/05/25.
//

import SwiftUI


struct TaskDetailView: View {
    
    @StateObject var viewModel = TaskDetailViewModel()
    @Environment(\.dismiss) var dismiss
    @State var editingTask: Task? = nil
    
    var title: String {
        editingTask != nil ? "Update task" : "New task"
    }
    
    var onSave: (String) -> Void = {_ in}
  
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Title", text: $viewModel.title)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    Button(action: {
                        if viewModel.validate() {
                            onSave(viewModel.title)
                            dismiss()
                        }
                    }) {
                        Text("Save")
                    }
                }
                
                if let error = viewModel.errorMessage {
                    Text(error).foregroundStyle(.red)
                }
            }
            .navigationTitle(title)
            .onAppear {
                if let task = editingTask {
                    viewModel.title = task.title ?? ""
                }
            }
        }
    }
}

#Preview {
    TaskDetailView()
}
