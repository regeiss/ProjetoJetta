//
//  StringExtension.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 21/05/23.
//

import Foundation

extension String
{
    func toCurrencyFormat() -> String
    {
        if let doubleValue = Double(self)
        {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "pt_BR")
            numberFormatter.numberStyle = NumberFormatter.Style.currency
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? ""
        }
        return ""
    }
    
    func toQuilometrosFormat() -> String
    {
        if let int32Value = Int32(self)
        {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "pt_BR")
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            numberFormatter.currencyGroupingSeparator = "."
            numberFormatter.groupingSize = 3
            return numberFormatter.string(from: NSNumber(value: int32Value)) ?? ""
        }
        return ""
    }
    
    func toShortDateFormat(style: DateFormatter.Style) -> String?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        guard let date = dateFormatter.date(from: self)
        else {return nil}
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: date)
    }
}

extension String
{
    var localized: String
    {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String
    {
        return String(format: self.localized, arguments: arguments)
    }
}
