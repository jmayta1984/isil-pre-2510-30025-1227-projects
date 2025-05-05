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
        tasks = taskDao.fetchTasks()
    }
    
    func addTask(title: String) {
        taskDao.addTask(title: title)
        fetchTasks()
    }
    
    func deleteTask(task: Task) {
        taskDao.deleteTask(task: task)
        fetchTasks()
    }
    
    func updateTask(title: String, id: UUID?) {
        if let id = id {
            taskDao.updateTask(title: title, id: id)
            fetchTasks()
        }
    }
}
