//
//  Task.swift
//  TaskTracker
//
//  Created by Thiago Monteiro on 4/8/26.
//

import SwiftData
import Foundation

@Model
final class Task {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
