//
//  UserDetailView.swift
//  ANZTask
//
//  Created by Ruchit on 31/05/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                // Profile photo
                if let photo = user.photo, let url = URL(string: photo) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.crop.circle.badge.exclam")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray)
                }

                // User details
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("Name: \(user.name)")
                        Text("Username: \(user.username)")
                        Text("Company: \(user.company)")
                        Text("Email: \(user.email)")
                        Text("Phone: \(user.phone)")
                        Text("Address: \(user.address)")
                        Text("Zip: \(user.zip)")
                        Text("State: \(user.state)")
                        Text("Country: \(user.country)")
                    }
                    .font(.body)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                Spacer()
            }
            .padding()
        }
        .navigationTitle("User Detail")
    }
}
