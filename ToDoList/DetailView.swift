//
//  DetailView.swift
//  ToDoList
//
//  Created by Pritam on 01/06/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var todo: TodoModel
    @State private var item: String = ""
    @State private var reminderIsOn = false
    @State private var completed = false
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 100,  to: Date.now)!
    @State private var notes = ""
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            TextField("Enter a todo here", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $dueDate)
                .padding(.bottom)
                .listRowSeparator(.hidden)
                .disabled(!reminderIsOn)
            
            Text("Notes: ")
                .padding(.top)
                .listRowSeparator(.hidden)
            
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed", isOn: $completed)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .navigationBarBackButtonHidden()
        .listStyle(.plain)
        .onAppear() {
            item = todo.item
            reminderIsOn = todo.reminderIsOn
            dueDate = todo.dueDate
            completed = todo.completed
            notes = todo.notes
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    todo.item = item
                    todo.reminderIsOn = reminderIsOn
                    todo.dueDate = dueDate
                    todo.completed = completed
                    todo.notes = notes
                    
                    modelContext.insert(todo)
                    guard let _ = try? modelContext.save() else {
                        return
                    }
                    
                    dismiss()
                }
            }
        }
    }
}
