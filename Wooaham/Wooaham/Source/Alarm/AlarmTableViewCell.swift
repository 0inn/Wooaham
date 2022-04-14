//
//  AlarmTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var alarmImg: UIImageView!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmAMPM: UILabel!
    @IBOutlet weak var alarmTitle: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func insertZero(_ number: Int) -> String {
        let str = String(format: "%02d", number)
        return str
    }
    
    func setAlarmData(_ alarmData: AlarmData){
        alarmImg.image = setIcon(alarmData.iconId)
        alarmTime.text = "\(insertZero(alarmData.hour)):\(insertZero(alarmData.minute))"
        alarmAMPM.text = alarmData.ampm
        alarmTitle.text = alarmData.title
        alarmSwitch.isOn = alarmData.enabled
    }
}
