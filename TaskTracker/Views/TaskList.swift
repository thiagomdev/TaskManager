//
//  TaskList.swift
//  TaskTracker
//
//  Created by Thiago Monteiro on 4/8/26.
//

import SwiftUI
import SwiftData

struct TaskList: View {
    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            ForEach(tasks) { tasks in
                HStack {
                    Text(tasks.title)
                        .strikethrough(tasks.isCompleted)
                    Spacer()
                    Image(
                        systemName: tasks.isCompleted ?
                        "checkmark.seal.fill" : "circlebadge")
                    .font(.title2)
                    .foregroundStyle(tasks.isCompleted ? .green : .gray)
                }
                .onTapGesture {
                    toogleTask(tasks)
                }
            }
            .onDelete(perform: deleteTask)
        }
        .listStyle(.inset)
    }
}

extension TaskList {
    private func toogleTask(_ task: Task) {
        task.isCompleted.toggle()
    }
    
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
}
