//
//  Todo_listApp.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//
import FirebaseCore
import SwiftUI

@main
struct Todo_listApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
