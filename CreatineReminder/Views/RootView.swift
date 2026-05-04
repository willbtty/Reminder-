//
//  RootView.swift
//  CreatineReminder
//
//  Created by Will Battey on 2/3/26.
//

import SwiftUI

let lavendar = Color(red: 0.58, green:0.58, blue:0.98)

let lavendarGradient = LinearGradient(
    gradient: Gradient(colors: [Color(red: 0.58, green: 0.58, blue: 0.98),
                                Color(red: 0.85, green: 0.7, blue: 1.0)]),
    startPoint: .top,
    endPoint: .bottom
)

struct RootView: View {
    @State var refresh: Bool = false
    @State var showingCamera: Bool = false
    @State private var selectedImage: UIImage?

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house"){
                NavigationView {
                    NavigationLink ("Show Camera") { CameraViewWrapper(selectedImage: $selectedImage) }
                }
            }
            Tab("Alarms", systemImage: "clock"){
                HomeView()
                    .refreshable(action: update)
            }
            Tab("Account", systemImage: "person"){
                NavigationStack{
                    AccountView()
                        .refreshable(action: update)
                }
            }
        }
    }

    func update() {
        refresh.toggle()
    }
}

#Preview {
    RootView()
}
