//
//  Task.swift
//  ToDo
//
//  Created by Alumno on 12/05/25.
//

import Foundation

struct Task: Identifiable, Equatable {
    let id: UUID
    let title: String
    let createdAt: Date
    let dueDate: Date
}
