//
//  HomeworkTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/24.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell {
    
    static let identifier = "HomeworkTableViewCell"
    
    @IBOutlet weak var homeworkBtn: UIButton!
    @IBOutlet weak var homeworkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton()
    }
    
    @IBAction func homeworkBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        setButtonColor(sender)
    }
    
    
    private func setButton() {
        homeworkBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        homeworkBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
    }
    
    func setData(_ data: HomeworkData) {
        homeworkBtn.isSelected = data.checked
        setButtonColor(homeworkBtn)
        homeworkLabel.text = data.title
    }
    
    func setButtonColor(_ btn: UIButton) {
        btn.tintColor = btn.isSelected ? .systemGreen : .lightGray
    }
}
