//
//  LogEntry.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

struct LogEntry
{
    let timestamp: Double
    let section: Int
    let amount: Double?
    let unit: String?
    let foodItems: [FoodItem]?
    
    init(timestamp: Double, section: Int, amount:Double? = nil, unit:String? = nil, foodItems:[FoodItem]? = nil)
    {
        self.timestamp = timestamp
        self.section = section
        self.amount = amount
        self.unit = unit
        self.foodItems = foodItems
    }
}
