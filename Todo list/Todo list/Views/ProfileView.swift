//
//  ProfileView.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile ...")
                }
                
            }
            .navigationTitle("Profile")
            
            Spacer()
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 55, height: 55)
        // info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        //Sign out
        Button {
            viewModel.logOut()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.red)
                Text("Log out")
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 35)
        }
        .padding(.top, 20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
