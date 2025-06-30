//
//  ContentView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView(latitude: -12.1253808, longitude: -77.0247300, title: "ISIL")
        /*
        GoogleMapView(latitude: -12.1253808, longitude: -77.0247300, zoom: 15, title: "ISIL", subTitle: "Campus Miraflores")
        */
    }
}

#Preview {
    //let _ = GoogleMapHelper.shared
    ContentView()
}
