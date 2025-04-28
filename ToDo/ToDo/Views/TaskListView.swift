//
//  TaskListView.swift
//  ToDo
//
//  Created by Alumno on 28/04/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.title ?? "")
                }
                .onDelete { indexSet in
                    if let index = indexSet.first {
                        viewModel.deleteTask(task: viewModel.tasks[index])
                    }
                }
            }
            .navigationTitle("To do")
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            viewModel.addTask(title: "Hi")
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                }
            }
            .onAppear {
                viewModel.fetchTasks()
            }
        }
    }
}

#Preview {
    TaskListView()
}

