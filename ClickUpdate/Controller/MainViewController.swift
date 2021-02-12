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
import CoreLocation

class MainViewController: UIViewController {
    
    let viewModel = CardViewModel()
    let mainViewModel = MainViewModel()
    var address = ""
    private var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        gestures()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLocation()
    }

    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    override func viewWillLayoutSubviews() {
        let teste = true
        if teste { //isNewUser() {
            let onboarding = UIHostingController(rootView: ContentView(viewModel: viewModel, dismissAction: onDismiss, saveAction: onSave))
            self.present(onboarding, animated: true, completion: nil)
            onboarding.isModalInPresentation = true
        }
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
    func checkNumber(_ ddd1: String, _ phone1: String) -> Bool {
        if (ddd1.count == 2) && (phone1.count == 9) {
            if ddd1.isNumeric && phone1.isNumeric {
                return true
            }
        }
        return false
    }
    
    func onDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func getLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func onSave() {
        let friendOne = "\(viewModel.ddd1)\(viewModel.phoneNumber1)"
        let sizeOk = checkNumber(viewModel.ddd1, viewModel.phoneNumber1)
        
        if sizeOk {
            viewModel.didSave = true
            mainViewModel.saveContacts(friendOne)
        } else {
            viewModel.alert = true
        }
    }
    
    @objc func callToFriend(recognizer: UITapGestureRecognizer) {
        let friends = mainViewModel.fetchFriends()
        let user = friends[0].user
        mainViewModel.call("\(friends[0].phoneNumber)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.sentSMS("\(user?.name)","\(friends[0].phoneNumber)")
        }

        //Saber se a ligação terminou, dá um intervalo e ligar para o segundo amigo
    }
    
    @objc func callToPolice(recognizer: UILongPressGestureRecognizer) {
        mainViewModel.call("190")
        
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

