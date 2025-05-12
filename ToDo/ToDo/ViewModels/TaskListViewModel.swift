//
//  TaskListViewModel.swift
//  ToDo
//
//  Created by Alumno on 28/04/25.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks = [Task]()
    let taskDao = TaskDao()
    
    func fetchTasks() {
        tasks = taskDao.fetchTasks().map({ entity in
            Task (id: entity.id ?? UUID(), title: entity.title ?? "", createdAt: entity.createdAt ?? Date(), dueDate: entity.dueDate ?? Date())
        })
    }
    
    func addTask(task: Task) {
        taskDao.addTask(task: task)
        fetchTasks()
    }
    
    func deleteTask(task: Task) {
        taskDao.deleteTask(task: task)
        fetchTasks()
    }
    
    func updateTask(task: Task) {
        taskDao.updateTask(task: task)
        fetchTasks()
        
    }
}
