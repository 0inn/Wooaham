//
//  getStoresAPI.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/29.
//

import Alamofire

class getStoresAPI {
    
    func getStores(_ delegate: MapViewController) {
        
        let url = "\(Const.URL.BASE_URL)/maps/stores"
                
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: StoresResponse.self) { (response) in
            switch response.result {
            case .success(let response):
                delegate.didSuccessStores(response.data)
                print("π₯\(response)")
            case .failure(let error):
                print("π₯\(error)")
            }
        }
    }
    
}
