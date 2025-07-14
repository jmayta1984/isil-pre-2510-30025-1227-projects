//
//  FavoriteDAO.swift
//  EasyMovie
//
//  Created by Alumno on 14/07/25.
//

import CoreData

class FavoriteDAO {
    
    static let shared = FavoriteDAO()
    
    let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    private func saveContext(){
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
    func insertFavorite(movie: Movie) {
        let entity = FavoriteEntity(context: context)
        entity.title = movie.title
        entity.id = Int32(movie.id)
        entity.poster = movie.poster
        saveContext()
    }
    
    func deleteFavorite(id: Int) {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: " id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(fetchRequest)
            if let entity = entities.first {
                context.delete(entity)
                saveContext()
            }
            
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAll() -> [Favorite] {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()

        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities.map { entity in
                Favorite(id: Int(entity.id),
                         title: entity.title ?? "",
                         poster: entity.poster ?? "")
            }
            
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func isFavorite(id: Int) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteEntity>
        fetchRequest = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: " id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(fetchRequest)
            return !entities.isEmpty
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
}
