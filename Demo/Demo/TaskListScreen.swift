//
//  TaskListScreen.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import SwiftUI

struct TaskListScreen: View {
    
    @State var tasks = [
        
        Task(title: "Asistir a clases", isCompleted: false),
        
        Task(title: "Estudiar", isCompleted: false)]
    
    @State var showForm = false
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(tasks) { task in
                    NavigationLink(destination: {
                        TaskView(title: task.title)
                    }) {
                        Text(task.title)

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
                TaskView { title in
                    tasks.append(
                        Task(title: title, isCompleted: false))
                }
            }
            
        }
        
        
    }
}

#Preview {
    TaskListScreen()
}
