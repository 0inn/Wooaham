//
//  MapViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

import CoreLocation
import NMapsMap

class MapViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    lazy var storesAPI = getStoresAPI()
    var stores: [StoresData]?
    
    @IBOutlet weak var mapView: NMFMapView!
    @IBOutlet weak var locationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getStores()
        setLocation()
    }
    
    private func setUI() {
        setMap()
        setButton()
    }
    
    private func setButton() {
        locationBtn.layer.shadowColor = UIColor.darkGray.cgColor
        locationBtn.layer.shadowOffset = CGSize.zero
        locationBtn.layer.shadowRadius = 6
        locationBtn.layer.shadowOpacity = 0.7
    }
    
    private func setMap() {
        mapView.positionMode = .direction
        mapView.zoomLevel = 16.0
    }
    
    private func setCamera() {
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
    }
    
    func setMarkers() {
        let image = NMFOverlayImage(name: "myLocation")
        let marker = NMFMarker()
        marker.iconImage = image
        marker.width = 80
        marker.height = 80
        marker.position = NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0)
        marker.mapView = mapView
        
        let myImage = NMFOverlayImage(name: "지킴이집")
        for i in 0 ... ((stores?.count ?? 0) - 1) {
            let marker = NMFMarker()
            marker.iconImage = myImage
            marker.position = NMGLatLng(lat: stores?[i].lng ?? 0.0, lng: stores?[i].lat ?? 0.0)
            marker.width = 60
            marker.height = 70
            marker.mapView = mapView
        }
    }
    
    @IBAction func locationBtnDidTap(_ sender: Any) {
        setLocation()
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    private func setLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
            setCamera()
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch(CLLocationManager.authorizationStatus()) {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .denied, .notDetermined, .restricted:
            locationManager.stopUpdatingLocation()
        }
    }
}
