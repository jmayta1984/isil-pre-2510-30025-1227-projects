//
//  TaskDetailViewModel.swift
//  ToDo
//
//  Created by Alumno on 5/05/25.
//
import Foundation

class TaskDetailViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage: String?
    
    func validate(id: UUID?) -> Task? {
        
        guard !title.isEmpty else {
            errorMessage = "Empty title"
            return nil
        }
        
        errorMessage = nil
        return Task(id: id ?? UUID(), title: title, createdAt: Date(), dueDate: dueDate)
        
    }
}
