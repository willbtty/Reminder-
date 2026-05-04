//
//  CreatineReminderApp.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/3/26.
//

import SwiftUI
import UserNotifications

@main
struct CreatineReminderApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .task {
                    let center = UNUserNotificationCenter.current()
                    do {
                        let granted = try await center.requestAuthorization(options: [.alert, .sound, .badge])
                        print("Notification permission granted: \(granted)")
                    } catch {
                        print("Notification permission error: \(error)")
                    }
                }
        }
    }
}
