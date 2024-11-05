//
//  ToDo.swift
//  ToDo
//
//  Created by YoungJae Lee on 11/4/24.
//

import Foundation

@Observable
class ToDo: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var description: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
        self.description = ""
    }
}
