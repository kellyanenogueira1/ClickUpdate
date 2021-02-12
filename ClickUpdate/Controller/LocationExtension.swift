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
        print("locations = \(locationValue.latitude) \(locationValue.longitude)")
        
        let location: CLLocation = CLLocation(latitude: locationValue.latitude, longitude: locationValue.longitude)
        convertingToAddress(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error)")
    }
    
    func convertingToAddress(_ location: CLLocation)  {
        let geoCoder: CLGeocoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("Reverse geocode fail: \(error!.localizedDescription)")
            }
            
            let myPlacemarks = placemarks! as [CLPlacemark]
            if myPlacemarks.count > 0 {
                let pm = placemarks![0]
                self.address = "\(pm.country)"
                print(pm.locality)
                print(pm.subLocality)
                print(pm.thoroughfare)
                print(pm.postalCode)
                print(pm.subThoroughfare)
            }
        })
    }
    
}

