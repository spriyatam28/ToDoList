//
//  DetailView.swift
//  ToDoList
//
//  Created by Pritam on 01/06/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var passedValue: String
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You Are a Swifty Legend!\nAnd you passed over the value \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Get back") {
                dismiss()
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(passedValue: "1")
}
