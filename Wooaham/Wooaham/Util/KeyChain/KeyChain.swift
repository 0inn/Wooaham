//
//  KeyChain.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import Security
import Alamofire

class KeyChain {
    
    class func create(account: String, jwt: String) {
        
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecValueData: jwt.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        SecItemDelete(keyChainQuery)
        
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "failed to saving Token")
    }
    
    class func read(account: String) -> String? {
        let KeyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue as Any,
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
    
    class func delete(account: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account
        ]
        
        let status = SecItemDelete(keyChainQuery)
        if status == errSecSuccess {
            print("remove key-data complete")
        } else {
            print("remove key-data failed")
        }
        //assert(status == noErr, "failed to delete the value, status code = \(status)")
    }
    
    class func getAuthorizationHeader(account: String) -> HTTPHeaders? {
        if let accessToken = KeyChain.read(account: account) {
            return ["ACCESS-TOKEN" : "\(accessToken)"] as HTTPHeaders
        } else {
            return nil
        }
    }
    
    class func getAuthorizationHeader(accessToken: String) -> HTTPHeaders? {
        return ["ACCESS-TOKEN" : "\(accessToken)"] as HTTPHeaders
    }
    
}
