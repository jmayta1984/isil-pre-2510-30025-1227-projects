//
//  TaskView.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import SwiftUI

struct TaskView: View {
    @State var title = ""
    @Environment(\.dismiss) var dismiss
    
    var addTask: (String) -> Void = {_ in }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
            }
            .navigationTitle(Text("Task"))
            .navigationBarItems(
                trailing: Button(action: {
                    addTask(title)
                    dismiss()
                }) {
                    Text("Done")
                }
            )
        }
        
    }
}

#Preview {
    TaskView()
}
