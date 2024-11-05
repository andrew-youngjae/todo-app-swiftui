//
//  ContentView.swift
//  ToDo
//
//  Created by YoungJae Lee on 11/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var todoList: [ToDo] = [
        ToDo(title: "친구 만나기"),
        ToDo(title: "과제 제출하기"),
        ToDo(title: "푹 쉬기"),
    ]
    
    func addToDo() {
        withAnimation {
            let newToDo = ToDo(title: "새로운 할일")
            modelContext.insert(newToDo)
        }
    }
    
    func deleleToDo(indexSet: IndexSet) {
        withAnimation {
            for index in indexSet {
                let targetToDo = todoList[index]
                modelContext.delete(targetToDo)
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
                            // 다음 화면의 View를 정의하는 부분
                            ToDoDetailView(todo: todo)
                        } label: {
                            // 현재 화면에서 버튼이 어떻게 보이는지 정의하는 부분
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
