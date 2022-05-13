//
//  SchoolTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    static let identifier = "SchoolTableViewCell"

    @IBOutlet weak var schoolNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ name: String) {
        schoolNameLabel.text = name
    }
    
}
