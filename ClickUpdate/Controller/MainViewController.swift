//
//  ViewController.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 05/02/21.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        gestures()
    }
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    override func viewWillLayoutSubviews() {
        if isNewUser() {
            let onboarding = UIHostingController(rootView: ContentView())
            self.present(onboarding, animated: true, completion: nil)
        }
        UserDefaults.standard.set(true, forKey: "isNewUser")
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

