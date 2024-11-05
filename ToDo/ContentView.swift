//
//  ContentView.swift
//  ToDo
//
//  Created by YoungJae Lee on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoList: [ToDo] = [
        ToDo(title: "친구 만나기"),
        ToDo(title: "과제 제출하기"),
        ToDo(title: "푹 쉬기"),
    ]
    
    func addToDo() {
        withAnimation {
            let newToDo = ToDo(title: "새로운 할일")
            todoList.append(newToDo)
        }
    }
    
    func deleleToDo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
                todoList.remove(at: index)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoList) { todo in
                    HStack {
                        Image(systemName: todo.isCompleted ?
                              "circle.fill" : "circle")
                        .foregroundStyle(Color.pink)
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                        NavigationLink {
                            Text("다음 화면입니다.")
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: Color.gray)
                                .foregroundStyle(todo.isCompleted ? Color.gray : Color.primary) // .primary : dark mode <--> light mode 전환시 자동으로 색변환하도록 함
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleleToDo)
                
            }
            .listStyle(.plain)
            .navigationTitle("ToDo List")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addToDo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
