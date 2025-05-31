//
//  ANZTaskApp.swift
//  ANZTask
//
//  Created by Ruchit on 31/05/25.
//

import SwiftUI

@main
struct ANZTaskApp: App {
    var body: some Scene {
        WindowGroup {
            ListViewFactory.make()
        }
    }
}
