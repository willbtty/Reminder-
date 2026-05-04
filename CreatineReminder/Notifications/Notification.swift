//
//  Notification.swift
//  CreatineReminder
//
//  Created by Will Battey on 4/27/26.
//

import UserNotifications
import UserNotificationsUI

public func createNotification(title: String, body: String, identifier: String, alarm: Date?) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound(named: UNNotificationSoundName("alarm.caf"))
    
    // Break down alarm
    var alarmDateComponents = DateComponents()
    if let alarm = alarm {
        alarmDateComponents = Calendar.current.dateComponents([.hour, .minute], from: alarm)
    }
    
    let hour = alarmDateComponents.hour ?? 0
    let minute = alarmDateComponents.minute ?? 0

    let trigger = UNCalendarNotificationTrigger(
        dateMatching: alarmDateComponents,
        repeats: true
    )
    
    
    let request = UNNotificationRequest(
        identifier: identifier,
        content: content,
        trigger: trigger
    )
    UNUserNotificationCenter.current().add(request)
}
