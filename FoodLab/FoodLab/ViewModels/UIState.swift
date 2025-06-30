//
//  UIState.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

enum UIState<T> {
    case initialState
    case loadingState
    case successState(T)
    case failureState(String)
}
