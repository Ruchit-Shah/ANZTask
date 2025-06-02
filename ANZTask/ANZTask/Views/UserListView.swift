//
//  UserListView.swift
//  ANZTask
//
//  Created by Ruchit on 31/05/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel: UserListViewModel
    @State private var searchText = ""

    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { user in
                user.name.lowercased().contains(searchText.lowercased()) ||
                user.email.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    List(filteredUsers) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}
