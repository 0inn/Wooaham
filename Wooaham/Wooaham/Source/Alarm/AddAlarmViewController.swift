//
//  AddAlarmViewController.swift
//  Wooaham
//
//  Created by 김영인 on 2022/04/05.
//

import UIKit
import Foundation

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sun: UIButton!
    @IBOutlet weak var mon: UIButton!
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thur: UIButton!
    @IBOutlet weak var fri: UIButton!
    @IBOutlet weak var sat: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtnClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // 알람 시간 설정
    @IBAction func changeAlarmTime(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let alarmTime = formatter.string(from: datePicker.date)
        print(alarmTime)
    }
    
    @IBAction func deleteBtnClick(_ sender: Any) {
        print("❌ 삭제")
        self.dismiss(animated: true)
    }
    
    @IBAction func successBtnClick(_ sender: Any) {
        if iconImg.image == nil {
            self.presentAlert(title: "아이콘을 선택해주세요!")
        }
        print("✨ 완료")
        self.dismiss(animated: true)
    }
    
}
