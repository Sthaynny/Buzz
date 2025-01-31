//
//  Date+.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 31/01/25.
//

import Foundation


extension Date{
      func formatDataPlublishAt() -> String{
        let date = self
        let format = DateFormatter()
        format.locale = Locale(identifier: "pt_BR")
        format.dateFormat = "d 'de' MMMM 'de' yyyy"
        return format.string(from: date)
    }
}
