//
//  ContentView.swift
//  Notifications
//
//  Created by Alumno on 7/07/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        VStack {
            Button("Request") {
                notificationManager.requestPermission()
            }
            
            Button("Schedule notification") {
                notificationManager.scheduleNotification()
            }
            
            Button("Calendar notification") {
                notificationManager.calendarNotification()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
