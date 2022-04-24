//
//  SchoolHomeworkTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import UIKit

class SchoolHomeworkTableViewCell: UITableViewCell {
    
    static let identifier = "SchoolHomeworkTableViewCell"
    
    @IBOutlet weak var schoolHWBtn: UIButton!
    @IBOutlet weak var schoolHWLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton()
    }
    
    @IBAction func schoolHWBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        setButtonColor(sender)
    }
    
    private func setButton() {
        schoolHWBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        schoolHWBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
    }
    
    func setData(_ data: SchoolHomeworkData) {
        schoolHWBtn.isSelected = data.checked
        setButtonColor(schoolHWBtn)
        schoolHWLabel.text = data.title
    }
    
    func setButtonColor(_ btn: UIButton) {
        btn.tintColor = btn.isSelected ? .systemGreen : .lightGray
    }
}
