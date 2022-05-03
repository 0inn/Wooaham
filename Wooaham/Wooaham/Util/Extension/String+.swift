//
//  String.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/04.
//

import UIKit

extension String {
    
    // 문자 비었는지 확인
    var isEmpty: Bool {
        return self.count == 0
    }
    // 문자 존재하는지 확인
    var isExists: Bool {
        return self.count > 0
    }
    // 공백 지워주기
    var trim: String? {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // MARK: comma
    // ex. "1234567890".insertComma == "1,234,567,890"
    var insertComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let _ = self.range(of: ".") {
            let numberArray = self.components(separatedBy: ".")
            if numberArray.count == 1 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString)
                else { return self }
                return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
            } else if numberArray.count == 2 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString)
                else {
                    return self
                }
                return (numberFormatter.string(from: NSNumber(value: doubleValue)) ?? numberString) + ".\(numberArray[1])"
            }
        }
        else {
            guard let doubleValue = Double(self)
            else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
        }
        return self
    }
    
    // MARK: - 문자열 substring
    func subString(from: Int, to: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...endIndex])
    }
    
}

