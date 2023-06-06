//
//  NewItemView.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 30)
            
            Form {
                //Due Date
                DatePicker("", selection: $viewModel.dueDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                
                // Title
                TextEditor(text: $viewModel.title)
                    .frame(height: 120)
                    .cornerRadius(5)
                    .border(Color.gray.opacity(0.3))

                //Button
                TLButton(title: "Save",
                         background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlret = true
                    }
                }
                         .alert(isPresented: $viewModel.showAlret) {
                             Alert(title: Text("Error"), message: Text("You can't select a future date."))
                         }
            }
            
        }
        .onAppear {
            UITableView.appearance().separatorColor = .clear
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
