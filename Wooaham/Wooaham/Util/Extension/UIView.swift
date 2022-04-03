//
//  UIView.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/03.
//

import UIKit

extension UIView {
    
    // MARK: 뷰 테두리 선 굵기
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    // MARK: 뷰 테두리 둥글게
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    // MARK: 뷰 테두리 선 색상
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
}

