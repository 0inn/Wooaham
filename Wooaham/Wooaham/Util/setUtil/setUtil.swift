//
//  setUtil.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/08.
//

import UIKit

// 이미지 설정
func setIcon(_ imgId: Int) -> UIImage {
    switch imgId {
    case 4:
        return UIImage(named: "house")!
    case 5:
        return UIImage(named: "school")!
    case 6:
        return UIImage(named: "bus")!
    default:
        return UIImage()
    }
}

func setRole(_ role: String) -> String {
    switch role {
    case "STUDENT":
        return "학생"
    case "TEACHER":
        return "선생님"
    case "PARENT":
        return "부모님"
    default:
        return ""
    }
}
