//
//  ViewController.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 05/02/21.
//

import UIKit
import SwiftUI
import CloudKit
import CoreData

class MainViewController: UIViewController {
    
//    let persistentStore: NSPersistentContainer = {
//            let appDelegate = UIApplication.shared.delegate as? AppDelegate
//            let container = appDelegate?.persistentContainer
//            guard let persistentContainer = container else { fatalError() }
//            return persistentContainer
//    }()
    
    let viewModel = CardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        gestures()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //fetchUser()
    }
    
//    func fetchUser() {
//        MainViewModel.currentModel.fetchAllUsers { result in
//            switch result {
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    override func viewWillLayoutSubviews() {
        let teste = true
        if teste { //isNewUser() {
            let onboarding = UIHostingController(rootView: ContentView(viewModel: viewModel, dismissAction: onDismiss, saveAction: onSave))
            self.present(onboarding, animated: true, completion: nil)
        }
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
    func onDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func onSave() {
        if check(viewModel.ddd1, viewModel.phoneNumber2) && check(viewModel.ddd2, viewModel.phoneNumber2) {
            let friendOne = "\(viewModel.ddd1)\(viewModel.phoneNumber1)"
            let friendTwo = "\(viewModel.ddd2)\(viewModel.phoneNumber2)"
            MainViewModel.currentModel.saveContacts(friendOne, friendTwo)
            
        } else {
            print("Incorrect!") //alert de contato incompleto
        }
    }
    
    func check(_ str1: String, _ str2: String) -> Bool {
        let characters = ["*",";",",","#"]
        if str1.count == 2 && str2.count == 9 {
            let strings = "\(str1)\(str2)"
            for character in characters {
                if !(strings.contains(character)){
                    return true
                }
                return false
            }
        }
        return false
    }
    
    @objc func callToFriend(recognizer: UITapGestureRecognizer) {
        print("triple tap")
     
        //Pega a localização e envia um sms
        //Liga
    }
    
    @objc func callToPolice(recognizer: UILongPressGestureRecognizer) {
        print("press")
        //
    }
    
    func gestures() {
        let press = UILongPressGestureRecognizer(target: self, action: #selector(callToPolice))
        press.minimumPressDuration = 3.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(callToFriend))
        tap.numberOfTapsRequired = 3

        view.addGestureRecognizer(press)
        view.addGestureRecognizer(tap)
    }

}

