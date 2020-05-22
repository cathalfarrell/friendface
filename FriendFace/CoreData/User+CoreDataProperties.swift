//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by Cathal Farrell on 22/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?

    public var wrappedId: String {
        id ?? "Unknown Id"
    }

    public var wrappedName: String {
        name ?? "Unknown name"
    }

    public var wrappedCompany: String {
        company ?? "Unknown company"
    }

    public var wrappedAge: Int16 {
        age
    }

    public var wrappedIsActive: Bool {
        isActive
    }

    public var wrappedEmail: String {
        email ?? "Unknown email"
    }

    public var wrappedAddress: String {
        address ?? "Unknown address"
    }

    public var wrappedAbout: String {
        about ?? "Unknown about"
    }

    public var wrappedRegistered: String {
        registered ?? "Unknown registered"
    }

    public var friendsArray: [Friend] {
        let set = friends as? Set<Friend> ?? []
        return set.sorted {$0.wrappedName < $1.wrappedName}
    }

    static var testUser: User {
        let cdUser = User()
        cdUser.id = "3e6fa1d2-527c-41e9-9da0-2d89eb0b8d6a"
        cdUser.isActive = true
        cdUser.name = "Brooks Spence"
        cdUser.age = 33
        cdUser.company = "Medmex"
        cdUser.email = "brooksspence@medmex.com"
        cdUser.address = "691 Woodside Avenue, Tibbie, Missouri, 1379"
        cdUser.about = "Reprehenderit voluptate cupidatat ipsum culpa aute qui culpa duis excepteur esse mollit ea." +
            "Tempor id elit et veniam dolor consequat quis. Consequat magna aliquip labore occaecat irure" +
            " exercitation ipsum eiusmod consequat tempor mollit aliqua. Sunt voluptate qui labore sit sunt" +
            " cillum aliquip. Qui nulla Lorem in esse adipisicing pariatur esse aute.\r\n"
        cdUser.registered = "2015-08-15T11:33:32-01:00"
//        tags: ["aliquip",
//        "esse",
//        "aliquip",
//        "adipisicing",
//        "ipsum",
//        "qui",
//        "mollit"],
        cdUser.friends = [Friend.testFriend]
        return cdUser
    }

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
