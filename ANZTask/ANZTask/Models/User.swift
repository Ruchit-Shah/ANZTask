//
//  User.swift
//  ANZTask
//
//  Created by Ruchit on 31/05/25.
//


import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let company: String
    let username: String
    let email: String
    let address: String
    let zip: String
    let state: String
    let country: String
    let phone: String
    let photo: String?
}
