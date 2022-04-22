//
//  AlarmTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    lazy var alarmSwitchDataManager = AlarmSwitchDataManager()
    var alarmId: CLong!
    
    @IBOutlet weak var alarmImg: UIImageView!
    @IBOutlet weak var alarmTime: UILabel!
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
    
    @IBAction func alarmSwitchValueChanged(_ sender: Any) {
        alarmSwitchDataManager.postAlarmSwitch(alarmId, alarmSwitch.isOn)
    }
    
    func insertZero(_ number: Int) -> String {
        let str = String(format: "%02d", number)
        return str
    }
    
    func setAlarmData(_ alarmData: AlarmData){
        alarmImg.image = setIcon(alarmData.iconId)
        alarmTime.text = "\(alarmData.time)"
        alarmTitle.text = alarmData.title
        alarmSwitch.isOn = alarmData.enabled
    }
}
