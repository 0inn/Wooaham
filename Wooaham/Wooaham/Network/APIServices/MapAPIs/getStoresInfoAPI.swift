//
//  getStoresInfoAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/06/01.
//

import Alamofire

class getStoresInfoAPI {
    func getStoresInfo(_ storeId: String, _ delegate: MapViewController) {
        let url = "\(Const.URL.BASE_URL)/maps/stores/\(storeId)"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: StoresInfoResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessStoresInfo(response.data)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}
