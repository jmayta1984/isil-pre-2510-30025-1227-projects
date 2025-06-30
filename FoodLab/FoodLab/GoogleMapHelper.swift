//
//  GoogleMapHelper.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import GoogleMaps

class GoogleMapHelper {
    static let shared = GoogleMapHelper()
    
    private init () {
        GMSServices.provideAPIKey("AIzaSyDhaqChbGH5l2bYrj1NvTjZw8AlSP_Me-w")
    }
    
}
