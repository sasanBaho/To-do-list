//
//  HeaderView.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.white)
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                    .bold()
            }
            //.offset(y: -50)
            .padding(.top, 30)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3 , height: 300)
        //.offset(y: -100)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", subtitle: "subtitle", angle: 10, backgroundColor: .black)
    }
}
