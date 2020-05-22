//
//  ContentView.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>

    var body: some View {
        NavigationView {
            List(users, id: \.self) { user in
                NavigationLink(destination: UserDetailView(allUsers: self.getUsers(), user: user)){
                    VStack {
                        HStack {
                            Text(user.wrappedName)
                                .font(.title)
                            Spacer()
                            Text(user.wrappedCompany)
                        }
                        HStack {
                            if user.wrappedIsActive {
                                Text("🟢")
                            } else {
                                Text("🔴")
                            }
                            Text(user.wrappedEmail)
                            Spacer()
                        }
                    }

                }
            }
            .navigationBarTitle("Friend Face")
            .onAppear(perform: loadData)
        }
    }

    func loadData() {
        if self.users.isEmpty {
            Users.loadDataToCD(moc: self.moc)
        } else {
            print("Already have the data from before")
        }
    }

    func getUsers() -> [User] {
        return users.sorted { (user1, user2) -> Bool in
            user2.wrappedName > user1.wrappedName
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
