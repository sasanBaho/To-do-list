//
//  ToDoListItem.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let currentDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone( _ state: Bool) {
        isDone = state
    }
    
}
