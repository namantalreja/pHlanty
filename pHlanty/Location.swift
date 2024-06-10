//
//  Location.swift
//  FINAL1
//
//  Created by Naman Talreja on 23/12/21.
//
//import Foundation
//import CoreLocation
//import Combine

//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

  //  private let locationManager = CLLocationManager()
    //@Published var locationStatus: CLAuthorizationStatus?
    //@Published var lastLocation: CLLocation?

  //  override init() {
    //    super.init()
      //  locationManager.delegate = self
      //  locationManager.desiredAccuracy = kCLLocationAccuracyBest
     //   locationManager.requestWhenInUseAuthorization()
       // locationManager.startUpdatingLocation()
    //}

   
    
    //var statusString: String {
      //  guard let status = locationStatus else {
          //  return "unknown"
        //}

//        switch status {
  //      case .notDetermined: return "notDetermined"
    //    case .authorizedWhenInUse: return "authorizedWhenInUse"
      //  case .authorizedAlways: return "authorizedAlways"
    //case .restricted: return "restricted"
    //    case .denied: return "denied"
      //  default: return "unknown"
        //}
    //}

    //func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
      //  locationStatus = status
        //print(#function, statusString)
   // }
    
    //func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      //  guard let location = locations.last else { return }
        //lastLocation = location
        //print(#function, location)
    //}
//}
import Foundation
import SwiftUI
import CoreLocation

/*
 snippet 1
class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        
        super.init()
        locationManager.delegate = self
    }
}
 */

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 0.4
        locationManager.startUpdatingLocation()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.first
        fetchCountryAndCity(for: locations.first)
    }
    
    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.currentPlacemark = placemarks?.first
        }
    }
}
