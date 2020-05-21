//
//  ContentView.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var users = [User]()

    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailView(allUsers: self.users, user: user)){
                    Text(user.name)
                }
            }
            .navigationBarTitle("Friend Face")
            .onAppear(perform: loadData)
        }
    }

    func loadData() {

        //To only returve data on load
        guard users.isEmpty else {
            print("Already retrieved users.")
            return
        }

        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        let urlRequest = URLRequest(url: url)
        print("Getting data...")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

            guard let data = data else {
                return
            }

            print("Data Retrieved: \(data.count)")
            self.parseData(data: data)

        }.resume()
    }

    func parseData(data: Data) {
        if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
            self.users = decodedResponse
            print("Users Parsed: \(self.users.count)")
        } else {
            print("Error: Failed to parse data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
