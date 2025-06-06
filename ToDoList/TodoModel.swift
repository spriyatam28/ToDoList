//
//  TodoModel.swift
//  ToDoList
//
//  Created by Pritam on 05/06/25.
//

import SwiftUI
import SwiftData

@MainActor
@Model
class TodoModel {
    var item: String = ""
    var reminderIsOn: Bool = false
    var completed: Bool = false
    var dueDate: Date = Date.now + 60*60*24
    var notes: String = ""
    
    init(item: String = "", reminderIsOn: Bool = false, completed: Bool = false, dueDate: Date = Date.now, notes: String = "") {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.completed = completed
        self.dueDate = dueDate
        self.notes = notes
    }
}

extension TodoModel {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: TodoModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add mock data
        container.mainContext.insert(TodoModel(item: "Learn Springbooot", reminderIsOn: false, completed: false, dueDate: Date.now + 60*60*24, notes: "Learn everything Springboot"))
        container.mainContext.insert(TodoModel(item: "Learn Swift", reminderIsOn: true, completed: false, dueDate: Date.now + 60*60*48, notes: "Learn everything Swift"))
        container.mainContext.insert(TodoModel(item: "Learn Reactjs", reminderIsOn: false, completed: false, dueDate: Date.now + 60*60*128, notes: "Learn everything Reactjs"))
        
        return container
    }
}
