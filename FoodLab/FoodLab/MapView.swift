//
//  MapView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    let title: String
    
    var body: some View {
        Map {
            Marker(title, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        }
    }
}
