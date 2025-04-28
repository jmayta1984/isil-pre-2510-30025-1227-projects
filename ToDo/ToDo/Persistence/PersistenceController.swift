//
//  PersistenceController.swift
//  ToDo
//
//  Created by Alumno on 28/04/25.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ToDoModel")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(filePath: "dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data stores: \(error)")
            }
        }
        
    }
}

