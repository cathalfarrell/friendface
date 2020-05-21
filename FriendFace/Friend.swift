//
//  Friend.swift
//  FriendFace
//
//  Created by Cathal Farrell on 21/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: String
    var name: String

    static var testFriend: Friend {
        return Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")
    }
}
