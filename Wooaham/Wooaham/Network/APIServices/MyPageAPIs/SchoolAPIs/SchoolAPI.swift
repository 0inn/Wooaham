//
//  SchoolAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class SchoolAPI {
    
    var mySchool = [SchoolRow]()
    var school: [SchoolRow]?
    
    func searchSchool(_ searchSchoolName: String, _ delegate: SearchSchoolViewController) {
        
        let url = "\(Const.URL.BASE_URL)/schools/"
        
        let param: [String: Any] = [
            "page" : 1
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: SchoolResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("🔥 \(response)")
                self.mySchool = response.schoolInfo[1].row
                self.school = self.mySchool.filter({($0.schoolName).contains(searchSchoolName) && ($0.schoolName).contains("초등학교")})
                
                delegate.didSuccessSearchSchool(self.school ?? [SchoolRow(schoolName: "검색 결과 없음.", officeCode: "", schoolCode: "")])
                
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
