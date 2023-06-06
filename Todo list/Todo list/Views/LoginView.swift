//
//  LoginView.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To do list",
                           subtitle: "Get the work done!",
                           angle: -10,
                           backgroundColor: .yellow)
                // Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.bottom, 20)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Sign in",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                    .listRowSeparator(.hidden)
                    
                    ZStack {
                        Text("  or  ")
                            .foregroundColor(.gray).opacity(0.5)
                            .background(.white)
                        Divider()
                    }
                    
                    Button {
                        // Sign in with google
                        viewModel.signWithGoogle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.gray).opacity(0.3)
                            HStack {
                                Image(uiImage: UIImage(named: "google")!)
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .scaledToFill()
                                    .padding()
                                Text("Sign in with Google")
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                        }
                    }
                    //.frame(height: 40)
                    .padding()
                    .listRowSeparator(.hidden)
                    
                    Spacer()
                }
                .frame(height: 380)
                .offset(y: -120)
                
                // Create account
                VStack {
                    Text("Please create account")

                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .navigationBarHidden(true)
            
        }
        .onAppear {
            // make form background color clear
           UITableView.appearance().backgroundColor = .clear
        }
    }
}
    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
