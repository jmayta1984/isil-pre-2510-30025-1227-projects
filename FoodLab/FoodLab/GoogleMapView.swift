//
//  GoogleMapView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let zoom: Float
    
    let title: String
    let subTitle: String
    
    func makeUIView(context: Context) -> some UIView {
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let camera = GMSCameraPosition(target: position, zoom: zoom)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let mapView = GMSMapView(options: options)
        
        let marker = GMSMarker(position: position)
        marker.title = title
        marker.snippet = subTitle
    
        marker.map = mapView
        return mapView
    }
    
    
}
