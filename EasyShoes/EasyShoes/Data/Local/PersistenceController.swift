//
//  PersistenceController.swift
//  EasyShoes
//
//  Created by Alumno on 16/06/25.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private init (){
        container = NSPersistentContainer(name: "EasyShoesModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
