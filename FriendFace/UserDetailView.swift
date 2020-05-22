//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import CoreData
import SwiftUI

struct UserDetailView: View {

    var allUsers: [User]
    var user: User

    var body: some View {
        Form {
            Section {
                Text("Name: \(user.wrappedName)")
                Text("Age: \(user.wrappedAge)")
                Text("Company: \(user.wrappedCompany)")
                Text("Email: \(user.wrappedEmail)")
                Text("Address: \(user.wrappedAddress)")
                Text("About: \(user.wrappedAbout)")
                Text("Registered: \(user.wrappedAddress)")
                //Text("Tags: \(user.tagsForDisplay)")
            }
            Section(header: Text("Friends")){

                List(getUsers(from: user.friendsArray), id: \.self) { userFriend in
                    //Must use where first in the users array to find friend

                    NavigationLink(destination: UserDetailView(allUsers: self.allUsers, user: userFriend)){
                        Text("\(userFriend.wrappedName)")
                    }
                }
            }
        }
        .navigationBarTitle("User Details")
        .onAppear(perform: printLog)

    }

    func printLog() {
        print(user)
    }

    func getUsers(from friends: [Friend]) -> [User] {
        var usersFound = [User]()

        for friend in friends {
            if let match = allUsers.first(where: {
                $0.wrappedId == friend.wrappedId
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
