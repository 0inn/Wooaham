//
//  ParentsTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/20.
//

import UIKit

class ParentsTableViewCell: UITableViewCell {
    
    static let identifier = "ParentsTableViewCell"

    @IBOutlet weak var parentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ name: String) {
        parentNameLabel.text = name
    }
}
