//
//  NotificationManager.swift
//  Notifications
//
//  Created by Alumno on 7/07/25.
//

import UserNotifications

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    func configure() {
        let notificationManager = UNUserNotificationCenter.current()
        notificationManager.delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Granted: \(granted)")
            }
        }
        
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Schedule notification sample"
        content.body = "Schedule notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification")
            }
        }
    }
    
    func calendarNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Calendar notification sample"
        content.body = "Calendar notification"
        content.sound = .default
        
        var date = DateComponents()
        date.hour = 15
        date.minute = 24
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification")
            }
        }
    }
    
}
