//
//  getMapAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/06/03.
//

import Alamofire

class getMapAPI {
    func getMap(_ delegate: MapViewController) {
        let url = "\(Const.URL.BASE_URL)/maps/\(UserDefaults.standard.integer(forKey: Key.UserIdKey.key))"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: MapResponse.self) { (response) in
            print(response)
            switch response.result {
            case .success(let response):
                delegate.didSuccessMap(response.data)
                print("🔥\(response)")
            case .failure(let error):
                print("🔥\(error)")
            }
        }
    }
}

