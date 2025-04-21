//
//  TaskListScreen.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import SwiftUI

struct TaskList: View {
    
    @State var tasks = [
        
        Task(title: "Asistir a clases", isCompleted: false),
        
        Task(title: "Estudiar", isCompleted: false)]
    
    @State var showForm = false
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(tasks.indices, id: \.self) { index in
                    NavigationLink(destination: {
                        TaskDetail(
                            title: tasks[index].title,
                            addTask: {_ in },
                            updateTask: { title in
                                tasks[index].title = title
                            }
                        )
                    }) {
                        Text(tasks[index].title)
                        
                    }
                }
                
                .onDelete { indexSet in
                    if let index = indexSet.first  {
                        tasks.remove(at: index)
                    }
                }
            }
            .navigationTitle(Text("Tasks"))
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showForm = true
                    }) {
                        Image(systemName: "plus")
                    }
            )
            .sheet(isPresented: $showForm) {
                TaskDetail(
                    addTask: { title in
                        tasks.append(
                            Task(title: title, isCompleted: false))
                    },
                    updateTask: {_ in }
                    
                )
                
                
            }
            
        }
        
        
    }
}

#Preview {
    TaskList()
}
