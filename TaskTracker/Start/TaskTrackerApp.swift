//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Thiago Monteiro on 4/7/26.
//

import SwiftUI
import SwiftData

@main
struct TaskTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
