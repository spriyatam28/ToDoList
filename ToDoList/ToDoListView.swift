//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Pritam on 01/06/25.
//

import SwiftUI

struct ToDoListView: View {
    var todos: [String] = [
        "Learn Swift",
        "Build Apps",
        "Earn Money",
        "Fuck Girls",
        "Rape Hoes"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos, id: \.self) { todo in
                    NavigationLink {
                        DetailView(passedValue: todo)
                    } label: {
                        Text(todo)
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
    }
}

#Preview {
    ToDoListView()
}
