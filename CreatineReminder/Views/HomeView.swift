//
//  HomeView.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/4/26.
//

import SwiftUI
import UserNotifications

struct HomeView: View {
    @State private var showingPopover = false
    @State private var alarm: Date? = nil

    var body: some View {
        ZStack {
            Color.black
                .scaleEffect(1.5)

            if let alarm {
                Text("Alarm set for \(alarm.formatted(date: .omitted, time: .shortened))")
                    .foregroundColor(.white)
            }

            Button(action: {
                self.showingPopover.toggle()
            }) {
                Text("Create Alarm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 200)
                    .background(lavendar.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .popover(isPresented: $showingPopover, arrowEdge: .top) {
                PopoverContentView(alarm: $alarm, showingPopover: $showingPopover)
            }
        }
    }
}

struct PopoverContentView: View {
    @Binding var alarm: Date?
    @Binding var showingPopover: Bool
    @State private var pickerDate = Date()

    var body: some View {
        Spacer(minLength: 100)
        VStack{
            Spacer(minLength: 100)
            Text("Pick a time")
                .font(Font.largeTitle.bold())
            Form {
                DatePicker("", selection: $pickerDate, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
            }
            .scrollContentBackground(.hidden)
            .background(.white.opacity(0.0))

            Button(action: {
                alarm = pickerDate
                showingPopover = false
                createNotification(title: "Creatine", body: "Take picture to turn off", identifier: "Test", alarm: alarm)
            }){
                Text("Set Alarm")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 200)
                    .background(Color.white.opacity(0.8))
                    .foregroundColor(.black)
                    .cornerRadius(25)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(lavendarGradient.scaleEffect(1.5))
    }
}

#Preview {
    HomeView()
}
