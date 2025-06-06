//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Pritam on 01/06/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var todos: [TodoModel]
    @State private var isSheetPresented: Bool = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    HStack {
                        Image(systemName: todo.completed ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                todo.completed.toggle()
                                guard let _ = try? modelContext.save() else { return }
                            }
                        
                        NavigationLink {
                            DetailView(todo: todo)
                        } label: {
                            Text(todo.item)
                        }
                    }
                    .font(.title2)
                }
                .onDelete { indexSet in
                    indexSet.forEach {
                        modelContext.delete(todos[$0])
                        guard let _ = try? modelContext.save() else { return }
                    }
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $isSheetPresented) {
                NavigationStack {
                    DetailView(todo: TodoModel())
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
