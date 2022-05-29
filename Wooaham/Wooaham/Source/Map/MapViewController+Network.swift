//
//  MapViewController+Network.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/29.
//

extension MapViewController {
    func getStores() {
        storesAPI.getStores(self)
    }
    
    func didSuccessStores(_ storesInfo: [StoresData]) {
        stores = storesInfo
        setMarkers()
    }
}
