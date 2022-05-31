//
//  MyStudentAPI.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import Alamofire

class MyStudentAPI {
    func myStudent(_ delegate: MyPageStudentViewController) {
        AF.request(URLConstant.children,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: APIConstant.header)
        .validate()
        .responseDecodable(of: MyStudentResponse.self) { response in
            switch response.result {
            case .success(let response):
                delegate.didSuccessMyStudent(response.data)
            case .failure:
                let decoder = JSONDecoder()
                if let data = response.data, let error = try? decoder.decode(ErrorResponse.self, from: data) {
                    delegate.failedToRequestMyStudent(error.message ?? "자녀 조회에 실패하였습니다.")
                }
            }
        }
    }
}
