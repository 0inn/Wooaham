//
//  TimeTableCollectionViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class TimeTableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDisplay()
    }
    
    private func setupDisplay() {
        topView.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    func setData(_ timeTableData: TimeTableOneDayRow) {
        timeLabel.text = "\(timeTableData.time)교시"
        subjectLabel.text = timeTableData.subject
    }

}
