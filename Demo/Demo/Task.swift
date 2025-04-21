//
//  Task.swift
//  Demo
//
//  Created by Alumno on 14/04/25.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    let isCompleted: Bool
}
