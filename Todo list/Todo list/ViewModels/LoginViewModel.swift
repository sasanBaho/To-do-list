//
//  LoginViewModel.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//
import FirebaseAuth
import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore
import SafariServices

class LoginViewModel : ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        // try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }

    func signWithGoogle() {
        
    }
    
   
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                  errorMessage = "Please fill in all the fields."
                  return false
              }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
