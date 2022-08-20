//
//  DailyNewsApp.swift
//  DailyNews
//
//  Created by mac on 2022-08-19.
//

import SwiftUI

@main
struct DailyNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //ContentView()
                HomeView(category: "dummy")
            }
        }
    }
}
