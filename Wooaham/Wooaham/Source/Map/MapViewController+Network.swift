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
    
    func getStoresInfo(_ storeId: String) {
        storesInfoAPI.getStoresInfo(storeId, self)
    }
    
    func didSuccessStoresInfo(_ storeInfo: StoresInfoData) {
        self.storeId = storeInfo.storeId
        self.setStoresUI(storeInfo)
    }
}
