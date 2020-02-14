//
//  FirstViewController.swift
//  openturnkey
//
//  Created by FuYuan Chuang on 2020/1/8.
//  Copyright © 2020 FuYuan Chuang. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {

    @IBOutlet weak var RecipientAddressText: UITextField!
    @IBOutlet weak var BTCPaymentText: UITextField!
    @IBOutlet weak var LocalPaymentText: UITextField!
    @IBOutlet weak var useAllFundsSwitch: UISwitch!

    var sysPreferences: OtkPreferences!

    override func viewDidLoad() {
        super.viewDidLoad()
        sysPreferences = OtkPreferences()

        useAllFundsSwitch.setOn(sysPreferences.getIsUseAllFounds(), animated: false)

        // Do any additional setup after loading the view.
        RecipientAddressText.setBottomBorder()
        BTCPaymentText.setBottomBorder()
        LocalPaymentText.setBottomBorder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        sysPreferences.setIsUseAllFounds(value: useAllFundsSwitch.isOn)
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
