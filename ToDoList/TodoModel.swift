//
//  TodoModel.swift
//  ToDoList
//
//  Created by Pritam on 05/06/25.
//

import SwiftUI
import SwiftData

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
