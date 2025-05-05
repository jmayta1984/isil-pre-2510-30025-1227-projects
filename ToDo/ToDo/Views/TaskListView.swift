//
//  TaskListView.swift
//  ToDo
//
//  Created by Alumno on 28/04/25.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TaskListViewModel()
    @State var selectedTask: Task? = nil
    @State var showDetail: Bool = false
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.title ?? "")
                        .onTapGesture {
                            selectedTask = task
                        }
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
                            selectedTask = nil
                            showDetail = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                }
            }
            .sheet(item: $selectedTask, content: { task in
                TaskDetailView(editingTask: task) { title in
                    viewModel.updateTask(title: title, id: selectedTask?.id)
                }
            })
            .sheet(isPresented: $showDetail, content: {
                TaskDetailView(editingTask: selectedTask) { title in
                    viewModel.addTask(title: title)
                }
            })
            .onAppear {
                viewModel.fetchTasks()
            }
        }
    }
}

#Preview {
    TaskListView()
}

