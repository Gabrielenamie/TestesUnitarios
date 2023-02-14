//
//  AccountBalance.swift
//  TestesUnitarios
//
//  Created by Gabriele Namie on 13/02/23.
//

import UIKit

struct AccountBalance {
    
    let balance: Double

    func getSpecialLimit() -> Double {
        if balance < 100 {
            return balance + 10
        } else if balance > 500 {
            return balance + 1000
        }
        
        return balance
    }
}
