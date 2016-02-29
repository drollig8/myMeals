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
}

func ==(lhs: FoodItem, rhs: FoodItem) -> Bool
{
    if lhs.name != rhs.name { return false }
    if lhs.calories != rhs.calories { return false }
    return true
}