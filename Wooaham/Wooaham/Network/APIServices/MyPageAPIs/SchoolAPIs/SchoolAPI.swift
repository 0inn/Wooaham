//
//  SchoolAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class SchoolAPI {
    
    func searchSchool(_ searchSchoolName: String, _ delegate: SearchSchoolViewController) {
        
        let url = "\(Const.URL.BASE_URL)/schools/"
        
        let param: [String: Any] = [
            "name" : searchSchoolName
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.default,
                   headers: KeyChain.getAuthorizationHeaderWithLocation(account: Key.KeyChainKey.accessToken))
        .validate()
        .responseDecodable(of: SchoolResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("🔥 \(response)")
                guard let schoolList = response.data else { return }
                delegate.didSuccessSearchSchool(schoolList)
                
            case .failure:
                print("🔥 \(response)")
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestSearchSchool(error.message ?? "학교 검색에 실패하였습니다.")
                }
                
            }
        }
        
    }
}
