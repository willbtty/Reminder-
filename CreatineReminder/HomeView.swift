////
////  HomeView.swift
////  CreatineReminder
////
////  Created by Will Battey on 2/4/26.
////
//
//import SwiftUI
//import AlarmKit
//import UIKit
//
//// Global so all the views in this file can see it?
//private let alarmManager = AlarmManager.shared
//
//struct HomeView: View {
//    @State private var showingPopover = false
//    @State private var alarm: Date? = nil
//    let time = Alarm.Schedule.Relative.Time(hour: 2, minute: 2)
//    var body: some View {
//        
//        ZStack {
//            // Background color
//            Color.black
//                .scaleEffect(1.5)
//            
//            if let alarm {
//                Text("Alarm set for \(alarm.formatted(date: .omitted, time: .shortened))")
//                    .foregroundColor(.white)
//            }
//            //            Button("Create New Alarm") {
//            //                self.showingPopover.toggle()
//            //                Task { await requestPermission() }
//            //            }
//            //            .buttonStyle(.borderedProminent)
//            //            .foregroundColor(.white)
//            //            .animation(.easeInOut(duration: 0.5), value: showingPopover)
//            //            .frame(maxHeight: .infinity, alignment: .bottom)
//            //            .tint(lavendar)
//            //            .popover(isPresented: $showingPopover, arrowEdge: .top) {
//            //                PopoverContentView(alarm: $alarm, showingPopover: $showingPopover)
//            //            }
//            
//            Button(action: {
//                self.showingPopover.toggle()
//                Task { await requestPermission() }
//            }) {
//                Text("Create Alarm")
//                    .font(.headline)
//                    .padding()
//                    .frame(maxWidth: 200)
//                    .background(lavendar.opacity(0.8))
//                    .foregroundColor(.white)
//                    .cornerRadius(25)
//            }
//            .task{ let perm = await requestPermission(); print(perm)}
//            .frame(maxHeight: .infinity, alignment: .bottom)
//            .popover(isPresented: $showingPopover, arrowEdge: .top) {
//                PopoverContentView(alarm: $alarm, showingPopover: $showingPopover)
//            }
//        }
//    }
//    
//    public func requestPermission() async -> Bool {
//        switch alarmManager.authorizationState {
//        case .notDetermined:
//            do {
//                return try await alarmManager.requestAuthorization() == .authorized
//            } catch {
//                return false
//            }
//        case .authorized:
//            return true
//        case .denied:
//            return true
//            
//        @unknown default:
//            return false
//        }
//    }
//}
//
//struct PopoverContentView: View {
//    @Binding var alarm: Date?
//    @Binding var showingPopover: Bool
//    @State private var pickerDate = Date()
//    var body: some View {
//        Spacer(minLength: 100)
//        VStack{
//            Spacer(minLength: 100)
//            Text("Pick a time")
//                .font(Font.largeTitle.bold())
//            Form {
//                DatePicker("", selection: $pickerDate, displayedComponents: .hourAndMinute)
//                    .datePickerStyle(.wheel)
//            }
//            .scrollContentBackground(.hidden)
//            .background(.white.opacity(0.0))
//            
//            Button(action: {
//                alarm = pickerDate
//                Task {
//                    await scheduleAlarm(alarm: alarm)
//                }
//                showingPopover = false
//            }){
//                Text("Set Alarm")
//                    .font(.headline)
//                    .padding()
//                    .frame(maxWidth: 200)
//                    .background(Color.white.opacity(0.8))
//                    .foregroundColor(.black)
//                    .cornerRadius(25)
//                
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(lavendarGradient.scaleEffect(1.5))
//    }
//    
//    
//    public func scheduleAlarm(alarm: Date?) async {
//        let alert = AlarmPresentation.Alert(title: "Take Your Creatine!")
//        let attributes = AlarmAttributes(
//            presentation: presentation,
//            metadata: metadata,
//            tintColor: Color.white)
//
//        do {
//            let timerAlarm = try await alarmManager.schedule(id: UUID(), configuration: .timer(duration: 30, attributes: alarmManager.AlarmConfiguration)
//        }
//        if (alarm != nil) {
//            // Get the hour and minute from the select Date, only if alarm is not nil
//            let calendar = Calendar.current
//            let components = calendar.dateComponents([.hour, .minute], from: alarm!)
//            let hour = components.hour   // Int?
//            let minute = components.minute // Int?
//            
//            // Actually scheduling the alarm I think?
//            if (hour != nil && minute != nil) {
//                let time = Alarm.Schedule.Relative.Time(hour:hour!, minute:minute!)
//                print(time.hour)
//                print(time.minute)
//            }
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}
