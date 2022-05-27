//
//  AdressesViewController.swift
//  QazRecycle
//
//  Created by Tima on 25.04.2022.
//

import UIKit
import MapKit
class AdressesViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    //let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = CLLocationCoordinate2D(latitude: 51.090873, longitude: 71.418338)
        annotaion.coordinate = CLLocationCoordinate2D(latitude:51.121972, longitude: 71.428013)
        annotaion.title = "QazRecycle"
        map.addAnnotation(annotaion)
        let region = MKCoordinateRegion(center: annotaion.coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
        map.setRegion(region, animated: true)
        
        let annotaionы = MKPointAnnotation()
        annotaionы.coordinate = CLLocationCoordinate2D(latitude: 51.090873, longitude: 71.418338)
       
        annotaionы.title = "QazRecycle"
        map.addAnnotation(annotaionы)
        let regionы = MKCoordinateRegion(center: annotaion.coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
        map.setRegion(regionы, animated: true)
        
        let annotaio = MKPointAnnotation()
        annotaio.coordinate = CLLocationCoordinate2D(latitude: 51.109294,  longitude: 71.395454)
       
        annotaio.title = "QazRecycle"
        map.addAnnotation(annotaio)
        let regio = MKCoordinateRegion(center: annotaion.coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
        map.setRegion(regio, animated: true)
        
    }
}
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        //checkLocationEnabled()
//        let annotaion = MKPointAnnotation()
//        annotaion.coordinate = CLLocationCoordinate2D(latitude: 51.100851, longitude: 71.454118)
//        map.addAnnotation(annotaion)
//    }
//
    
    
//    func checkLocationEnabled(){
//        if CLLocationManager.locationServicesEnabled(){
//            setupManager()
//            checkAuthorization()
//        }else{
//            showAlertLocation(title: "У вас выключена служба геолакации", message: "Хотите включить?", url: URL(string: "APP-Prefs:root=LOCATION_SERVICES"))
//
//        }
//    }
//    func setupManager(){
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//
//
//    func checkAuthorization(){
//        let authorizationStatus: CLAuthorizationStatus
//        let manager = CLLocationManager()
//        if #available(iOS 14, *) {
//            authorizationStatus = manager.authorizationStatus
//        } else {
//            authorizationStatus = CLLocationManager.authorizationStatus()
//        }
//        switch authorizationStatus {
//
//        case .authorizedAlways:
//            break
//        case .authorizedWhenInUse:
//            map.showsUserLocation = true
//            locationManager.startUpdatingLocation()
//            break
//        case .denied:
//            showAlertLocation(title:  "Вы запретили использование местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
//            break
//        case .restricted:
//            break
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        @unknown default:
//            print("")
//        }
//    }
//
//    func showAlertLocation(title:String,message:String?,url:URL?){
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        let settingsAction = UIAlertAction(title: "Настройки", style: .default){(alert) in
//            if let url = url{
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
//        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//
//        alert.addAction(settingsAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true, completion: nil)
//    }
//
//}
//
//
//
//extension AdressesViewController:CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last?.coordinate{
//          let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000,  longitudinalMeters: 5000)
//            map.setRegion(region,animated:true)
//        }
//    }
//    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
//        checkAuthorization()
//    }
//}
 
