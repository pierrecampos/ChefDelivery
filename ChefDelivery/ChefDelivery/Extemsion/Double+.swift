//
//  Double+.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 20/02/24.
//

import Foundation

extension Double {
    func formatToCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.maximumFractionDigits = 2
        return formatter.string(for: self) ?? ""
    }
}
