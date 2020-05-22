//
//  LoadedUser.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import Foundation

struct LoadedUser: Codable, Identifiable {
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
    var friends: [LoadedFriend]

    var tagsForDisplay: String {
        return tags.joined(separator: ", ")
    }
}
