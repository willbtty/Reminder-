//
//  ContentView.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/3/26.
//

import SwiftUI



struct RootView: View {
    @State var refresh: Bool = false
    func update() {
        refresh.toggle()
    }
    var body: some View {
        TabView {
            Tab("Alarms", systemImage: "clock"){
                
            }
            Tab("Home", systemImage: "house"){
                
            }
            Tab("Account", systemImage: "person"){
                NavigationStack{
                    AccountView()
                        .refreshable(action: update)
                }
            }
        }
    }
}

#Preview {
    RootView()
}
