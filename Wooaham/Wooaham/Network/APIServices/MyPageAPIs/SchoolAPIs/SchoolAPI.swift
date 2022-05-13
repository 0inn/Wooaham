//
//  SchoolAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire
import Foundation

class SchoolAPI {
    
    var mySchool = [SchoolRow]()
    var school: [SchoolRow]?
    
    func searchSchool(_ searchSchoolName: String, _ delegate: SearchSchoolViewController) {
        
        let url = "\(Const.URL.BASE_URL)/schools"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil)
        .validate()
        .responseDecodable(of: SchoolResponse.self) { response in
            switch response.result {
            case .success(let response):
                
                self.mySchool = response.schoolInfo[1].row
                self.school = self.mySchool.filter({($0.schoolName).contains(searchSchoolName)})
                
                delegate.didSuccessSearchSchool(self.school ?? [SchoolRow(schoolName: "검색 결과 없음.", officeCode: "", schoolCode: "")])
                
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestSearchSchool(error.message ?? "자녀 변경에 실패하였습니다.")
                }
                
            }
        }
        
    }
}
