//
//  NewItemViewModel.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlret = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            currentDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate <= Date() else {
            return false
        }
        
        return true
    }
}
