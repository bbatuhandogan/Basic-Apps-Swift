//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Batuhan Doğan on 11.05.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let symbol: String
    let price: Float?
    
    var priceString: String {
        return String(format: "%.2f", price!)
    }
}
