//
//  UserService.swift
//  ANZTask
//
//  Created by Ruchit on 31/05/25.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUsers() async throws -> [User]
}

final class UserService: UserServiceProtocol {
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://fake-json-api.mock.beeceptor.com/users") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self, from: data)
    }
}
