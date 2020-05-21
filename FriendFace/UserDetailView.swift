//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {

    var allUsers: [User]
    var user: User

    var body: some View {
        Form {
            Section {
                Text("Name: \(user.name)")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
                Text("Registered: \(user.address)")
                Text("Tags: \(user.tagsForDisplay)")
            }
            Section(header: Text("Friends")){

                List(getUsers(from: user.friends)) { userFriend in
                    //Must use where first in the users array to find friend

                    NavigationLink(destination: UserDetailView(allUsers: self.allUsers, user: userFriend)){
                        Text("\(userFriend.name)")
                    }
                }
            }
        }
        .navigationBarTitle("User Details")
    }

    func getUsers(from friends: [Friend]) -> [User] {
        var usersFound = [User]()

        for friend in friends {
            if let match = allUsers.first(where: {
                $0.id == friend.id
            }) {
                usersFound.append(match)
            }
        }

        return usersFound
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {

        let allUsers = [User]()
        let user = User.testUser

        return NavigationView {
            UserDetailView(allUsers: allUsers, user: user)
        }
    }
}
