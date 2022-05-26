//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Batuhan Doğan on 9.05.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var splitTotal: Float?
    var percentage: String?
    var splitValue: Int?
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitTotalLabel.text = String(format: "%.2f", splitTotal!)
        descriptionLabel.text = "Split between \(splitValue!) people, with \(percentage!) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
