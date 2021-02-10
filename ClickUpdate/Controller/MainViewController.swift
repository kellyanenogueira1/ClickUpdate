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
        let friendOne = "\(viewModel.ddd1)\(viewModel.phoneNumber1)"
        let friendTwo = "\(viewModel.ddd2)\(viewModel.phoneNumber2)"
        
        if (friendOne.isNumeric && friendTwo.isNumeric) {
            MainViewModel.currentModel.saveContacts(friendOne, friendTwo)
        } else {
            let alert = UIAlertController(title: "Aviso", message: "Contato incorreto", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tente Novamente", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)//print("Incorrect!") //alert de contato incompleto
        }
    }
    
    @objc func callToFriend(recognizer: UITapGestureRecognizer) {
        print(MainViewModel.currentModel.call("85988996971"))
        sentSMS("85988996971")
        
        //Saber se a ligação terminou, dá um intervalo e ligar para o segundo amigo
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

