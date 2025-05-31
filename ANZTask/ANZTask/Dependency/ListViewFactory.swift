//
//  ListViewFactory.swift
//  ANZTask
//
//  Created by Ruchit on 31/05/25.
//

import SwiftUI

struct ListViewFactory {
    @MainActor static func make() -> some View {
        let service = UserService()
        let viewModel = UserListViewModel(userService: service)
        return UserListView(viewModel: viewModel)
    }
}
