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
    @FetchRequest(entity: CDUser.entity(), sortDescriptors: []) var cdUsers: FetchedResults<CDUser>

    @State private var users = [CDUser]()

    var body: some View {
        NavigationView {
            List(cdUsers, id: \.self) { user in
                NavigationLink(destination: UserDetailView(allUsers: self.users, user: user)){
                    Text(user.wrappedName)
                }
            }
            .navigationBarTitle("Friend Face")
            .onAppear(perform: loadData)
        }
    }

    func loadData() {
        if self.cdUsers.isEmpty {
        Users.loadDataToCD(moc: self.moc)
            self.users = cdUsers.sorted(by: { (user1, user2) -> Bool in
                user1.wrappedName > user2.wrappedName
            })
        } else {
            print("Already have the data from before")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
