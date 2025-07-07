//
//  GoogleMapHelper.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import GoogleMaps

class GoogleMapHelper {
    static let shared = GoogleMapHelper()
    
    // TODO: API KEY HERE
    private init () {
        GMSServices.provideAPIKey("YOUR API KEY HERE")
    }
    
}
