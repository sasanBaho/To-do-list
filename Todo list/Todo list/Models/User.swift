//
//  User.swift
//  Todo list
//
//  Created by Sasan Baho on 2023-06-01.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
