//
//  UserListViewModelTests.swift
//  ANZTaskTests
//
//  Created by Ruchit on 31/05/25.
//

import XCTest
@testable import ANZTask

final class MockUserService: UserServiceProtocol {
    func fetchUsers() async throws -> [User] {
        return [
            User(
                id: 1,
                name: "Ruchit Shah",
                company: "RBS",
                username: "ruchitshah",
                email: "ruchit@gmail.com",
                address: "Surat",
                zip: "395009",
                state: "Gujarat",
                country: "India",
                phone: "922-88-22-289",
                photo: "https://json-server.dev/ai-profiles/86.png"
            ),
            User(
                id: 2,
                name: "Jemini Shah",
                company: "JRS",
                username: "jeminishah",
                email: "jemini@gmail.com",
                address: "Adajan Surat",
                zip: "395009",
                state: "Gujarat",
                country: "India",
                phone: "923-49-22-939",
                photo: "https://json-server.dev/ai-profiles/95.png"
            )
        ]
    }
}

@MainActor
final class UserListViewModelTests: XCTestCase {
    func testFetchUsersSuccess() async throws {
        let mockService = MockUserService()
        let viewModel = UserListViewModel(userService: mockService)

        await viewModel.fetchUsers()

        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchUsersFailure() async throws {
        struct FailingUserService: UserServiceProtocol {
            func fetchUsers() async throws -> [User] {
                throw URLError(.notConnectedToInternet)
            }
        }

        let viewModel = UserListViewModel(userService: FailingUserService())

        await viewModel.fetchUsers()

        XCTAssertEqual(viewModel.users.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
