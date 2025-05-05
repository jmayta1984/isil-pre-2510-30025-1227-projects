//
//  TaskDao.swift
//  ToDo
//
//  Created by Alumno on 28/04/25.
//
import CoreData

struct TaskDao {
    private let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
         do {
             return try context.fetch(request)
         } catch (let error) {
             print(error)
             return []
         }
    }
    
    func addTask(title: String) {
        let task = Task(context: context)
        task.id = UUID()
        task.title = title
        saveContext()
        
    }
    
    func updateTask(title: String, id: UUID) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            if let entity = try context.fetch(request).first {
                entity.title = title
                saveContext()
            }
        } catch (let error) {
            print(error)
            
        }
    }
    
    func deleteTask(task: Task) {
        context.delete(task)
        saveContext()
    }
    
    private func saveContext() {
        if (context.hasChanges) {
            do {
                try context.save()
            } catch (let error) {
                print(error)
            }
        }
    }
}

