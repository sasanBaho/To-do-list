//
//  TLButton.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-02.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .frame(height: 50)
            }
        }
        .padding(.top, 20)
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "title", background: Color.blue) {
            // action
        }
    }
}
