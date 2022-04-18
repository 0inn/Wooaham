//
//  NoticeCollectionViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/07.
//

import UIKit

class NoticeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var noticeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setNotice(_ noticeInfo: NoticeData) {
        noticeTitle.text = noticeInfo.title
    }

}
