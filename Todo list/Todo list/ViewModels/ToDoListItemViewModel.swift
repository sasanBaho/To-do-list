//
//  ToDoListItemViewModel.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for single to list items view (Each row in item list)
class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
