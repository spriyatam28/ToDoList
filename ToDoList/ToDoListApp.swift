//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Pritam on 01/06/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: TodoModel.self)
        }
    }
}
