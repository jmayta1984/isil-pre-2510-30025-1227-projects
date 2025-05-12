//
//  TaskDao.swift
//  ToDo
//
//  Created by Alumno on 28/04/25.
//
import CoreData

struct TaskDao {
    private let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    func fetchTasks() -> [TaskEntity] {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
         do {
             return try context.fetch(request)
         } catch (let error) {
             print(error)
             return []
         }
    }
    
    func addTask(task: Task) {
        let taskEntity = TaskEntity(context: context)
        taskEntity.id = task.id
        taskEntity.title = task.title
        taskEntity.createdAt = task.createdAt
        taskEntity.dueDate = task.dueDate
        saveContext()
        
    }
    
    func updateTask(task: Task) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
        do {
            if let entity = try context.fetch(request).first {
                entity.title = task.title
                entity.dueDate = task.dueDate
                saveContext()
            }
        } catch (let error) {
            print(error)
            
        }
    }
    
    func deleteTask(task: Task) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            print(error)
        }
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

