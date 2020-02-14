//
//  OtkPreferences.swift
//  openturnkey
//
//  Created by FuYuan Chuang on 2020/2/14.
//  Copyright © 2020 FuYuan Chuang. All rights reserved.
//

import Foundation


class OtkPreferences {

    let userDefaultValue = UserDefaults.standard
    let KEY_USE_ALL_FUNDS = "USEALLFUNDS"
    let KEY_FEES_INCLUDED = "FEESINCLUDEED"
    let KEY_USE_FIX_ADDRESS = "USEFIXADDRESS"
    let KEY_LOCAL_CURRENCY = "LOCALCURRENCY"
    let KEY_TRANS_FEE = "TRANSFEE"
    let KEY_TRANS_FEE_CUSTOMER = "TRANSFEECUSTOMER"

    init() {
        // Set default switch value
        userDefaultValue.register(defaults: [KEY_USE_ALL_FUNDS: false])
        userDefaultValue.register(defaults: [KEY_FEES_INCLUDED: false])
        userDefaultValue.register(defaults: [KEY_USE_FIX_ADDRESS: false])
        userDefaultValue.register(defaults: [KEY_LOCAL_CURRENCY: 0])
        userDefaultValue.register(defaults: [KEY_TRANS_FEE: 0])
        userDefaultValue.register(defaults: [KEY_TRANS_FEE_CUSTOMER: 0.0001])
    }

    func getIsUseAllFounds() -> Bool {
        return userDefaultValue.bool(forKey: KEY_USE_ALL_FUNDS)
    }

    func setIsUseAllFounds(value: Bool) {
        userDefaultValue.set(value, forKey: KEY_USE_ALL_FUNDS)
    }

    func getIsFeeIncluded() -> Bool {
        return userDefaultValue.bool(forKey: KEY_FEES_INCLUDED)
    }

    func setIsFeeIncluded(isInclude: Bool) {
        userDefaultValue.set(isInclude, forKey: KEY_FEES_INCLUDED)
    }

    func getIsUsedFixAddress() -> Bool {
        return userDefaultValue.bool(forKey: KEY_USE_FIX_ADDRESS)
    }

    func setIsUsedFixAddress(isUsed: Bool) {
        userDefaultValue.set(isUsed, forKey: KEY_USE_FIX_ADDRESS)
    }

    func getLocalCurrency() -> Int {
        return userDefaultValue.integer(forKey: KEY_LOCAL_CURRENCY)
    }

    func setLocalCurrency(value: Int) {
        userDefaultValue.set(value, forKey: KEY_LOCAL_CURRENCY)
    }

    func getTransactionFee() -> Int {
        return userDefaultValue.integer(forKey: KEY_TRANS_FEE)
    }
    
    func setTransactionFee(value: Int) {
        userDefaultValue.set(value, forKey: KEY_TRANS_FEE)
    }

    func getCustomerTransFee() -> Double {
        return userDefaultValue.double(forKey: KEY_TRANS_FEE_CUSTOMER)
    }
    
    func setCustomerTransFee(value: Double) {
        userDefaultValue.set(value, forKey: KEY_TRANS_FEE_CUSTOMER)
    }
}
