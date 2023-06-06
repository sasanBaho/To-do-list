//
//  ToDoListItemView.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item : ToDoListItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.title)
                    .font(.body)
                if #available(iOS 15.0, *) {
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                } else {
                    // Fallback on earlier versions
                }
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "123",
            title: "title",
            dueDate: Date().timeIntervalSince1970,
            currentDate: Date().timeIntervalSince1970,
            isDone: false))
    }
}
