//
//  ToDoDetailView.swift
//  ToDo
//
//  Created by YoungJae Lee on 11/5/24.
//

import SwiftUI

struct ToDoDetailView: View {
    
    @State var todo: ToDo
    
    var body: some View {
        VStack {
            TextField("ToDo Title", text: $todo.title)
                .font(.title2)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
            TextEditor(text: $todo.detail)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
        }
        .padding()
        .navigationTitle("Today's ToDo")
    }
}

#Preview {
    ToDoDetailView(todo: ToDo(title: "ToDo Detail"))
}
