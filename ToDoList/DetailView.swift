//
//  DetailView.swift
//  ToDoList
//
//  Created by Pritam on 01/06/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State var todo: String
    @State private var reminderIsOn = false
    @State private var completed = false
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 100,  to: Date.now)!
    @State private var notes = ""
    
    var body: some View {
        List {
            TextField("Enter a todo here", text: $todo)
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
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    // TODO: - Add saved details
                }
            }
        }
    }
}
