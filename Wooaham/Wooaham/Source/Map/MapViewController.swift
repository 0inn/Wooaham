//
//  MapViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

import Alamofire
import CoreLocation
import NMapsMap

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    var locationManager = CLLocationManager()
    lazy var storesAPI = getStoresAPI()
    lazy var storesInfoAPI = getStoresInfoAPI()
    lazy var mapAPI = getMapAPI()
    var stores: [StoresData]?
    var storeId: String?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var mapView: NMFMapView!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var storeView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getStores()
        getMap()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        if (!storeView.isHidden) { dismissStoreView() }
    }
    
    // MARK: - Function
    
    private func setUI() {
        setMap()
        setButton()
    }
    
    private func setButton() {
        //locationBtn.transform = CGAffineTransform(translationX: 0, y: -100)
        locationBtn.layer.shadowColor = UIColor.darkGray.cgColor
        locationBtn.layer.shadowOffset = CGSize.zero
        locationBtn.layer.shadowRadius = 6
        locationBtn.layer.shadowOpacity = 0.7
    }
    
    private func setMap() {
        if (UserDefaults.standard.string(forKey: Key.RoleKey.key) == "STUDENT") {
            mapView.positionMode = .direction
        }
        mapView.zoomLevel = 16.0
    }
    
    func setCamera() {
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: UserDefaults.standard.double(forKey: Key.MapKey.latKey), lng: UserDefaults.standard.double(forKey: Key.MapKey.lngKey)))
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
    }
    
    func setMarkers() {
        let myImage = NMFOverlayImage(name: "지킴이집")
        for i in 0 ... ((stores?.count ?? 0) - 1) {
            let marker = NMFMarker()
            marker.iconImage = myImage
            marker.position = NMGLatLng(lat: stores?[i].lng ?? 0.0, lng: stores?[i].lat ?? 0.0)
            marker.width = 60
            marker.height = 70
            marker.touchHandler = { (overlay) -> Bool in
                self.getStoresInfo(self.stores?[i].storeId ?? "")
                return false
            }
            marker.mapView = mapView
        }
    }
    
    func setStoresUI(_ storesInfo: StoresInfoData) {
        nameLabel.text = "\(storesInfo.name)"
        phoneNumLabel.text = "\(storesInfo.phoneNum)"
        addressLabel.text = "\(storesInfo.newAddress)"
        if (storeView.isHidden && storeId == storesInfo.storeId) { showStoreView() }
        else { dismissStoreView() }
    }
    
    func showStoreView() {
        UIView.animate(withDuration: 0, animations: {
            self.locationBtn.transform = CGAffineTransform(translationX: 0, y: -50)
        })
        tabBarController?.tabBar.isHidden = true
        storeView.isHidden = false
    }
    
    func dismissStoreView() {
        UIView.animate(withDuration: 0, animations: {
            self.locationBtn.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        tabBarController?.tabBar.isHidden = false
        storeView.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction func locationBtnDidTap(_ sender: Any) {
        setLocation()
        if (UserDefaults.standard.string(forKey: Key.RoleKey.key) == "PARENT") {
            let image = NMFOverlayImage(name: "myLocation")
            let marker = NMFMarker()
            marker.iconImage = image
            marker.position = NMGLatLng(lat: UserDefaults.standard.double(forKey: Key.MapKey.latKey), lng: UserDefaults.standard.double(forKey: Key.MapKey.lngKey))
            marker.width = 70
            marker.height = 70
            marker.mapView = mapView
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func setLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
            UserDefaults.standard.set("\(locationManager.location?.coordinate.latitude ?? 0)", forKey: Key.MapKey.latKey)
            UserDefaults.standard.set("\(locationManager.location?.coordinate.longitude ?? 0)", forKey: Key.MapKey.lngKey)
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
