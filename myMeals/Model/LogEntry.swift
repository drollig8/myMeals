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
    
    
    private let timestampKey = "timestampKey"
    private let sectionKey = "sectionKey"
    private let amountKey = "amountKey"
    private let unitKey = "unitKey"
    private let foodItemsKey = "foodItemsKey"
    
    var plistDict: NSDictionary {
        
        var dict = [String:AnyObject]()
        
        dict[timestampKey] = NSNumber(double: timestamp)
        dict[sectionKey] = NSNumber(integer: section)
        
        if let unit = unit {
            dict[unitKey] = unit
        }
        if let amount = amount {
          dict[amountKey] = NSNumber(double: amount)
        }
        if let foodItems = foodItems {
            var foodItemsDicts = [NSDictionary]()
            for fooditem in foodItems {
                foodItemsDicts.append(fooditem.plistDict)
            }
            dict[foodItemsKey] = foodItemsDicts
        }
        return dict
    }
    
    init(timestamp: Double, section: Int, amount:Double? = nil, unit:String? = nil, foodItems:[FoodItem]? = nil)
    {
        self.timestamp = timestamp
        self.section = section
        self.amount = amount
        self.unit = unit
        self.foodItems = foodItems
    }
    
    
    /*
    
    init?(dict: NSDictionary)
    {
    guard let name = dict[nameKey] as? String else
    { return nil }
    
    self.name = name
    self.calories = dict[caloriesKey] as? Double
    self.carbs = dict[carbsKey] as? Double
    self.protein = dict[proteinKey] as? Double
    self.fat = dict[fatKey] as? Double
    
    self.itemDescription = dict[itemDescriptionKey] as? String
    self.timestamp = dict[timestampKey] as? Double
    if let locationDict = dict[locationKey] as? NSDictionary {
    self.location = Location(dict: locationDict)
    } else {
    self.location = nil
    }
    }
    */
}
