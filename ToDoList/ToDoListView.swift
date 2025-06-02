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
        "Earn Money"
    ]
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos, id: \.self) { todo in
                    NavigationLink {
                        DetailView(todo: todo)
                    } label: {
                        Text(todo)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $isSheetPresented) {
                NavigationStack {
                    DetailView(todo: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
