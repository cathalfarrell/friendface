//
//  CDFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Cathal Farrell on 22/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//
//

import Foundation
import CoreData


extension CDFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFriend> {
        return NSFetchRequest<CDFriend>(entityName: "CDFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CDUser?

    public var wrappedId: String {
        id ?? "Unknown Id"
    }

    public var wrappedName: String {
        name ?? "Unknown name"
    }

    static var testFriend: CDFriend {
        let friend = CDFriend()
        friend.id = "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0"
        friend.name = "Hawkins Patel"
        return friend
    }

}
