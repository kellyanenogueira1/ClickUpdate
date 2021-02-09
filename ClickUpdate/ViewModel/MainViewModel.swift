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
    
    static var currentModel = MainViewModel()
    
    enum error: Error {
        case requestNotAccepted
        case notFoundUserId
        case withoutUserIdentity
    }
    
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
    
//    func fetchAllUsers(_ completion: @escaping (Result<String, Error>) -> Void) {
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "CD_User", predicate: predicate)
//
//        database.perform(query, inZoneWith: CKRecordZone.init(zoneName: "com.apple.coredata.cloudkit.zone").zoneID) { result, error in
//
//            if let falha = error {
//                DispatchQueue.main.async {
//                    completion(.failure(falha))
//                }
//            }
//
//            guard let arrayCKRecordUsers = result else { return}
//
//            arrayCKRecordUsers.forEach {
//                self.getUserName(withRecordID: $0.recordID) { result in
//                    DispatchQueue.main.async {
//                        completion(.success(result))
//                    }
//                }
//            }
//        }
//    }
    
    func saveContacts(_ phoneNumber1: String, _ phoneNumber2: String) {
        let user = User(context: context)
        getUserName() { userName in
            user.name = userName
        }
        
        if user.callEmergency == [] {
            let friend1 = Friend(context: context)
            friend1.phoneNumber = phoneNumber1
            let friend2 = Friend(context: context)
            friend2.phoneNumber = phoneNumber2
            
            user.addToCallEmergency([friend1, friend2])
            
            do {
                try context.save()
            } catch {
                print("Unable to save contacts")
            }
        } else {
            print("já tem contatos") //chama função de editar
        }
        fetchFriends()
    }
    
    func fetchFriends() {
        do {
            let friends = try context.fetch(Friend.fetchRequest())
            print(friends)
        } catch {
            print("Unable to capture contacts")
        }
        
    }
    
    func updateFriends(_ phoneNumber1: String, _ phoneNumber2: String) {
        
    }
    
    func removeFriends() {
        
    }
}
