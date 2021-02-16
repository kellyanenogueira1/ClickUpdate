//
//  LocationExtension.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 10/02/21.
//

import UIKit
import CoreLocation

extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        let location: CLLocation = CLLocation(latitude: locationValue.latitude, longitude: locationValue.longitude)
        convertingToAddress(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Atenção", message: "Se sua localização não puder ser acessada os contatos de emergência saberão da sua situação mas não poderão encontrá-lo.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Estou ciente", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func convertingToAddress(_ location: CLLocation)  {
        let geoCoder: CLGeocoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Reverse geocode fail: \(error!.localizedDescription)")
            }
            
            guard let myPlacemarks = placemarks as? [CLPlacemark] else { return }
            if myPlacemarks.count > 0 {
                let pm = placemarks![0]
                self.address = "Minha localização é: \(pm.locality ?? "")/\(pm.subLocality ?? "") - \(pm.thoroughfare ?? "") \(pm.subThoroughfare ?? ""), \(pm.postalCode ?? "")"
            }
        })
    }
    
}

