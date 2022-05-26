//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Batuhan Doğan on 9.05.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    let totalBill: Float?
    let percentage: String?
    let splitNumber: Int?
    
    var intPct = 0
    
    init(totalBill: Float?, percentage: String?, splitNumber: Int?) {
        self.totalBill = totalBill
        self.percentage = percentage
        self.splitNumber = splitNumber
    }
    
    mutating func getTotalPerPerson() -> Float {
        convertPctToInt(stringPct: percentage)
        let totalWithPct = totalBill! + (totalBill!*Float(intPct)/100)
        let splitBill = totalWithPct / Float(splitNumber!)
        return splitBill
    }
    
    func getPercentage() -> String {
        return percentage ?? "10%"
    }
    
    mutating func convertPctToInt(stringPct: String?) {
        if stringPct == "10%" {
            intPct = 10
        } else if stringPct == "20%" {
            intPct = 20
        } else {
            intPct = 0
        }
    }
}
