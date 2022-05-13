//
//  MyStudentTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/05/13.
//

import UIKit

class MyStudentTableViewCell: UITableViewCell {
    
    static let identifier = "MyStudentTableViewCell"

    @IBOutlet weak var studentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ name: String) {
        studentNameLabel.text = "🧒🏻 \(name)"
    }
    
}
