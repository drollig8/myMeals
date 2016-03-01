//
//  FoodItem.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

struct FoodItem: Equatable
{
    let name: String
    let calories: Double?
    let carbs: Double?
    let protein: Double?
    let fat: Double?
    
    init(name: String, calories: Double? = nil, carbs: Double? = nil, protein: Double? = nil, fat: Double? = nil)
    {
        self.name = name
        self.calories = calories
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
    }
    
    private let nameKey = "nameKey"
    private let caloriesKey = "caloriesKey"
    private let carbsKey = "carbsKey"
    private let proteinKey = "proteinKey"
    private let fatKey = "fatKey"
    
    var plistDict: NSDictionary {
        
        var dict = [String:AnyObject]()
        dict[nameKey] = name
        
        if let calories = calories {
            dict[caloriesKey] = NSNumber(double: calories)
        }

        if let carbs = carbs {
            dict[carbsKey] = NSNumber(double: carbs)
        }
        if let protein = protein {
            dict[proteinKey] = NSNumber(double: protein)
        }
        if let fat = fat {
            dict[fatKey] = NSNumber(double: fat)
        }
        return dict
    }
    
    init?(dict: NSDictionary)
    {
        guard let name = dict[nameKey] as? String else
        { return nil }
        
        self.name = name
        self.calories = dict[caloriesKey] as? Double
        self.carbs = dict[carbsKey] as? Double
        self.protein = dict[proteinKey] as? Double
        self.fat = dict[fatKey] as? Double
    }
}

func ==(lhs: FoodItem, rhs: FoodItem) -> Bool
{
    if lhs.name != rhs.name { return false }
    if lhs.calories != rhs.calories { return false }
    return true
}