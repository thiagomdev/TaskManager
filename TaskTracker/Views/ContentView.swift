//
//  ContentView.swift
//  TaskTracker
//
//  Created by Thiago Monteiro on 4/7/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                VStack {
                    Text("Task Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    listView
                    
                    HStack {
                        TextField("New Task", text: $newTaskTitle)
                            .textFieldStyle(.roundedBorder)
                        Button("Add") {
                            addTask()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(newTaskTitle.isEmpty)
                    }
                    .padding(.bottom)
                }
                .padding()
            } label: {
                Text("Task Tracker")
            }
            
            
        }
    }
}

extension ContentView {
    @ViewBuilder
    private var listView: some View {
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

extension ContentView {
    private func toogleTask(_ task: Task) {
        task.isCompleted.toggle()
    }
}

extension ContentView {
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
}

extension ContentView {
    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        modelContext.insert(newTask)
        newTaskTitle = ""
    }
}

#Preview {
    ContentView()
}
