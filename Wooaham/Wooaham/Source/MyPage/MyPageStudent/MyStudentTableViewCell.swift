//
//  MyStudentTableViewCell.swift
//  Wooaham
//
//  Created by κΉμμΈ on 2022/05/13.
//

import UIKit

class MyStudentTableViewCell: UITableViewCell {
    
    static let identifier = "MyStudentTableViewCell"

    @IBOutlet weak var studentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ name: String) {
        studentNameLabel.text = "π§π» \(name)"
    }
    
}
