//
//  MainViewModel.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//

import Foundation
import UIKit
import CloudKit
import CoreData

class MainViewModel {
    
    let container: CKContainer
    let database: CKDatabase
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   // static var currentModel = MainViewModel()
    
    init() {
        container = CKContainer.init(identifier: "iCloud.com.kellyanenogueira.ClickUpdate")
        database = container.privateCloudDatabase
    }
    
    func getUserName(completion: @escaping (String) -> Void) {
       
        container.requestApplicationPermission(.userDiscoverability) {(status, error) in
            guard status == .granted, error == nil else {
                return
            }
            self.container.fetchUserRecordID { (record, error) in
                self.container.discoverUserIdentity(withUserRecordID: record!, completionHandler: { (userIdentity, error) in
                    
                    guard let components = userIdentity?.nameComponents, error == nil else {
                        return
                    }
                    
                    let username = "\(components.givenName ?? "") \(components.familyName ?? "")"
                    completion(username)
                })
            }
        }
    }
    
    func saveContacts(_ phoneNumber1: String) {
        if fetchAllUsers() == [] && fetchFriends() == [] {
            let user = User(context: context)
            getUserName { [self] username in
                user.name = username
                let friend1 = Friend(context: context)
                friend1.phoneNumber = phoneNumber1

                user.addToCallEmergency([friend1])
                do {
                    try context.save()
                } catch {
                    print("Unable to save contacts")
                }
            }
        } else {
            var friends = fetchFriends()
            friends[0].phoneNumber = phoneNumber1
        }
    }
    
    func fetchAllUsers()  -> [User] {
        var users: [User] = []
        do {
            users = try context.fetch(User.fetchRequest())
        } catch {
            print("Unable to capture contacts")
        }
        return users
    }
    
    func fetchUser(_ username: String) -> User {
        let request = User.fetchRequest() as NSFetchRequest<User>
        let pred = NSPredicate(format: "name CONTAINS '\(username)'")
        request.predicate = pred
       
        let user = try! self.context.fetch(request)
  
        return user[0]
        
    }
    
    func fetchFriends() -> [Friend] {
        var friends: [Friend] = []
        do {
            friends = try context.fetch(Friend.fetchRequest())
        } catch {
            print("Unable to capture contacts")
        }
        return friends
    }
    
    func updateFriends(_ phoneNumber1: String, _ phoneNumber2: String) {
        // Pegar o user
        //Pegar amigos de user user.callEmergency
        //Substituir friends
    }
    
    func removeFriends() {
        
    }
    
    func call(_ phoneNumber: String) -> Bool {
        if !phoneNumber.isEmpty {
            if let url = URL(string: "tel://" + phoneNumber) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    return true
                }
            }
        }

        return false
    }
}
