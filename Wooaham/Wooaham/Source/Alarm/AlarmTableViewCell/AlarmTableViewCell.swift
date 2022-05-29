//
//  AlarmTableViewCell.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    lazy var alarmSwitchDataManager = AlarmSwitchAPI()
    var alarmId: CLong!
    
    @IBOutlet weak var alarmView: UIView!
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
        
        if (alarmData.iconId == 7) {
            alarmView.backgroundColor = .mainGreen.withAlphaComponent(0.5)
        } else {
            alarmView.backgroundColor = .mainPink.withAlphaComponent(0.5)
        }
        
        let time = alarmData.time
        let ampmRange = time.index(time.startIndex, offsetBy: 2)
        let ampm = time[time.startIndex...ampmRange]

        let timeRange = time.index(after: ampmRange)
        let onlyTime = time[timeRange..<time.endIndex]

        alarmTime.attributedText = NSMutableAttributedString()
            .regular(string: "\(ampm)", fontSize: 30)
            .regular(string: "\(onlyTime)", fontSize: 40)
        
        alarmTitle.text = alarmData.title
        alarmSwitch.isOn = alarmData.enabled
    }
}
