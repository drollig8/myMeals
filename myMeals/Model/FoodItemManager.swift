//
//  FoodItemManager.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//



import Foundation
// This FoodItemManager exposes an interface to count, add and remove items
class FoodItemManager
{
    private var foodItems = [FoodItem]()
    func itemCount() -> Int
    {
        return foodItems.count
    }
    
    func addItem(item: FoodItem)
    {
        if !foodItems.contains(item) {
            foodItems.append(item)
        }
    }
    
    func itemAtIndex(index: Int) -> FoodItem
    {
        return foodItems[index]
    }
    
    func removeItemAtIndex(index: Int)
    {
        foodItems.removeAtIndex(index)
    }
    
    func removeAll()
    {
        foodItems.removeAll()
    }
    
  
}
