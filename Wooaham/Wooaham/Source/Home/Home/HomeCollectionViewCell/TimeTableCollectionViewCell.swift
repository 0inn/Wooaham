//
//  TimeTableCollectionViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class TimeTableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDisplay()
    }
    
    private func setupDisplay() {
        topView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }

}
