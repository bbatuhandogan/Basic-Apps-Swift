//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Batuhan Doğan on 9.05.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tipPct: String = "10%"
    var stepperValue: Int = 1
    var calculatorBrain: CalculatorBrain?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        clearButtonUI(sender: zeroPctButton)
        clearButtonUI(sender: tenPctButton)
        clearButtonUI(sender: twentyPctButton)
        
        sender.isSelected = true
        tipPct = sender.currentTitle!
    }
    
    func clearButtonUI(sender: UIButton) {
            sender.isSelected = false
        }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f" ,sender.value)
        stepperValue = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculatorBrain = CalculatorBrain(totalBill: Float(billTextField.text!), percentage: tipPct, splitNumber: stepperValue)
        print(calculatorBrain?.getTotalPerPerson() ?? "Error")
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.splitTotal = calculatorBrain?.getTotalPerPerson()
            destinationVC.percentage = calculatorBrain?.getPercentage()
            destinationVC.splitValue = calculatorBrain?.splitNumber
        }
    }
    
}
