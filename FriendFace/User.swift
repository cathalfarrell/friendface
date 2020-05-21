//
//  User.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]

    var tagsForDisplay: String {
        return tags.joined(separator: ", ")
    }

    static var testUser: User {
        return User(id: "3e6fa1d2-527c-41e9-9da0-2d89eb0b8d6a", isActive: true, name: "Brooks Spence",
        age: 33, company: "Medmex", email: "brooksspence@medmex.com",
        address: "691 Woodside Avenue, Tibbie, Missouri, 1379",
        about: "Reprehenderit voluptate cupidatat ipsum culpa aute qui culpa duis excepteur esse mollit ea." +
            "Tempor id elit et veniam dolor consequat quis. Consequat magna aliquip labore occaecat irure" +
            " exercitation ipsum eiusmod consequat tempor mollit aliqua. Sunt voluptate qui labore sit sunt" +
            " cillum aliquip. Qui nulla Lorem in esse adipisicing pariatur esse aute.\r\n",
        registered: "2015-08-15T11:33:32-01:00",
        tags: ["aliquip",
        "esse",
        "aliquip",
        "adipisicing",
        "ipsum",
        "qui",
        "mollit"],
        friends: [Friend.testFriend])
    }
}
