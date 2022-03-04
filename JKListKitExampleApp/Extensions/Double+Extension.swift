//
//  Double+Extension.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 07-03-22.
//

import Foundation

extension Double {

    func formatCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        let currentAmount = NSNumber(floatLiteral: self)
        return formatter.string(from: currentAmount)
    }
}
