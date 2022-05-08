//
//  TokenUtil.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Security
import Alamofire
 
class TokenUtils {
    
    func create(_ service: String, account: String, value: String) {
        
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        SecItemDelete(keyChainQuery)
        
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "failed to saving Token")
    }
    
    func read(_ service: String, account: String) -> String? {
        let KeyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(KeyChainQuery, &dataTypeRef)
        
        if(status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            return value
        } else {
            print("failed to loading, status code = \(status)")
            return nil
        }
    }
    
    func delete(_ service: String, account: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]
        
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr, "failed to delete the value, status code = \(status)")
    }
    
    // header에 jwt 넣는 함수
    func getAuthorizationHeader(serviceID: String) -> HTTPHeaders? {
        let serviceID = serviceID
        if let accessToken = self.read(serviceID, account: "accessToken") {
            return ["ACCESS-TOKEN" : "\(accessToken)"] as HTTPHeaders
        } else {
            return nil
        }
    }
    
}
