//
//  User.swift
//  ROCController
//
//  Created by Maximilian Alexander on 6/20/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import RealmSwift


/**
 * This is different from a Realm SyncUser instance.
 * Consider it like an entry or a contact in a directory.
 */
class User : Object {
    
    dynamic var _id: String = UUID().uuidString
    dynamic var username: String = ""
    dynamic var email: String = ""
    dynamic var name: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
    
    static var globalUsersRealm: Realm {
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: URL(string: "realm://\(SampleAppConstants.syncRosHost):\(SampleAppConstants.syncRosPort)/users")!)
        let realm = Realm.Configuration(syncConfiguration: syncConfig)
        return try! Realm(configuration: realm)
    }
    
    static func upsertUserInfo(userId: String = SyncUser.current!.identity!, username: String, name: String, email: String) {
        let user = User()
        user._id = userId
        user.username = username
        user.name = name
        user.email = email
        let realm = User.globalUsersRealm
        try! realm.write {
            realm.add(user, update: true)
        }
    }
    
    static func searchForUsers(searchTerm: String = "") -> Results<User> {
        let realm = User.globalUsersRealm
        let predicate = NSPredicate(format: "(username CONTAINS[cd] %@) OR (name CONTAINS[cd] %@) OR (email CONTAINS[cd] %@)", searchTerm, searchTerm, searchTerm)
        let result = realm.objects(User.self).filter(predicate)
        return result
    }
    
}
