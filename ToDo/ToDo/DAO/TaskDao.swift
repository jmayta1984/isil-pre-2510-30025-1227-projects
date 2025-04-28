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
        task.title = title
        saveContext()
        
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

