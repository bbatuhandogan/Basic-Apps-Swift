//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Batuhan Doğan on 9.05.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBmiValue() -> String {
        let bmiToString = String(format: "%.2f", bmi?.value ?? 0.0)
        print(bmiToString)
        return bmiToString
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Error"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.green
    }
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemTeal)
        case 18.5..<24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.systemBlue)
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.systemRed)
        default:
            print("Error")
        }
    }
}
