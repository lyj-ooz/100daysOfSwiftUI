//
//  ExpenseItem.swift
//  iExpenses
//
//  Created by YJ on 2022/03/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    // generate UUID
    var id = UUID()
    
    let name: String
    let type: String
    let amount: Double
    
    
}
