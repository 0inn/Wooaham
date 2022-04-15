//
//  Functions.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/14.
//

import UIKit

// 이미지 설정
func setIcon(_ imgId: Int) -> UIImage {
    switch imgId {
    case 1:
        return UIImage(named: "school")!
    case 2:
        return UIImage(named: "bus")!
    case 3:
        return UIImage(named: "house")!
    default:
        return UIImage(named: "")!
    }
}
