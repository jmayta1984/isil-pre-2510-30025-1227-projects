//
//  NotificationsApp.swift
//  Notifications
//
//  Created by Alumno on 7/07/25.
//

import SwiftUI

@main
struct NotificationsApp: App {
    
    let notificationManager = NotificationManager()
    
    init() {
        notificationManager.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
        }
    }
}
