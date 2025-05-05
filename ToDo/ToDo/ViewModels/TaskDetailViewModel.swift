//
//  TaskDetailViewModel.swift
//  ToDo
//
//  Created by Alumno on 5/05/25.
//
import Foundation

class TaskDetailViewModel: ObservableObject {
    @Published var title = ""
    @Published var errorMessage: String?
    
    func validate() -> Bool {
        
        guard !title.isEmpty else {
            errorMessage = "Empty title"
            return false
        }
        
        errorMessage = nil
        return true
        
    }
}
