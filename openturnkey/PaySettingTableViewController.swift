//
//  PaySettingTableViewController.swift
//  openturnkey
//
//  Created by FuYuan Chuang on 2020/1/24.
//  Copyright © 2020 FuYuan Chuang. All rights reserved.
//

import UIKit

class PaySettingTableViewController: UITableViewController {
    
    @IBOutlet var uitableview: UITableView!
    @IBOutlet weak var feeincludeSwitch: UISwitch!
    @IBOutlet weak var usefixaddrSwitch: UISwitch!
    
    var sysPreferences: OtkPreferences!

    override func viewDidLoad() {
        super.viewDidLoad()
        uitableview.tableFooterView = UIView()
        sysPreferences = OtkPreferences()

        // Set default switch value
        feeincludeSwitch.setOn(sysPreferences.getIsFeeIncluded(), animated: false)
        usefixaddrSwitch.setOn(sysPreferences.getIsUsedFixAddress(), animated: false)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (1 == indexPath.section) {
            if (0 == indexPath.row) {
                // User Guide
                UIApplication.shared.open(URL(string: "https://openturnkey.com/guide")!)
            }
            else if (1 == indexPath.row) {
                // About
                let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                let controller = UIAlertController(title: "Software Version", message: appVersion, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        sysPreferences.setIsFeeIncluded(isInclude: feeincludeSwitch.isOn)
        sysPreferences.setIsUsedFixAddress(isUsed: usefixaddrSwitch.isOn)
    }
}

class LocalCurrencyTableViewController: UITableViewController {
    
    @IBOutlet var lctableview: UITableView!

    var selectedRow: Int = 0
    var sysPreferences: OtkPreferences!

    override func viewDidLoad() {
        super.viewDidLoad()
        lctableview.tableFooterView = UIView()
        sysPreferences = OtkPreferences()

        // Set default selected row
        selectedRow = sysPreferences.getLocalCurrency()
        let selectedCell = lctableview.cellForRow(at: IndexPath(row: selectedRow, section: 0))
        selectedCell?.accessoryType = .checkmark
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lctableview.deselectRow(at: indexPath, animated: false)
        if selectedRow == indexPath.row {
            return
        }
        // Remove the checkmark from the previously selected filter item.
        if let previousCell = lctableview.cellForRow(at: IndexPath(row: selectedRow, section: indexPath.section)) {
            previousCell.accessoryType = .none
        }
        // Mark the newly selected filter item with a checkmark.
        if let cell = lctableview.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        // Remember this selected filter item.
        selectedRow = indexPath.row
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sysPreferences.setLocalCurrency(value: selectedRow)
    }
}

class TransactionFeeTableViewController: UITableViewController {
    
    @IBOutlet var tftableview: UITableView!
    @IBOutlet weak var customerFeeText: UITextField!

    var selectedRow: Int = 0
    var sysPreferences: OtkPreferences!

    override func viewDidLoad() {
        super.viewDidLoad()
        tftableview.tableFooterView = UIView()
        sysPreferences = OtkPreferences()

        // Set default selected row
        selectedRow = sysPreferences.getTransactionFee()
        let selectedCell = tftableview.cellForRow(at: IndexPath(row: selectedRow, section: 0))
        selectedCell?.accessoryType = .checkmark
        customerFeeText.text = String(sysPreferences.getCustomerTransFee())
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tftableview.deselectRow(at: indexPath, animated: false)
        if selectedRow == indexPath.row {
            return
        }
        // Remove the checkmark from the previously selected filter item.
        if let previousCell = tftableview.cellForRow(at: IndexPath(row: selectedRow, section: indexPath.section)) {
            previousCell.accessoryType = .none
        }
        // Mark the newly selected filter item with a checkmark.
        if let cell = tftableview.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        // Remember this selected filter item.
        selectedRow = indexPath.row
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sysPreferences.setTransactionFee(value: selectedRow)
        if 3 == selectedRow {
            let customerFee: Double = Double(customerFeeText.text!)!
            sysPreferences.setCustomerTransFee(value: customerFee)
        }
    }
}
