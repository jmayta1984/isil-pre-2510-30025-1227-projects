//
//  UIState.swift
//  EasyShoes
//
//  Created by Alumno on 2/06/25.
//

enum UIState<T: Equatable> : Equatable {
    case idle
    case loading
    case success(T)
    case failure(String)
}
