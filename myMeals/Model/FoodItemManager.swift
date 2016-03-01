//
//  FoodItemManager.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//



import UIKit

// This FoodItemManager exposes an interface to count, add and remove items

class FoodItemManager:NSObject
{
    private var foodItems = [FoodItem]()
    
    var foodItemURL: NSURL
    {
        let fileURLS = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        guard let documentURL = fileURLS.first else { fatalError() }
        return documentURL.URLByAppendingPathComponent("foodItems.plist")
    }
    
    // subscribe to notofication center on init
    
    override init()
    {
        super.init()  // requires that we derive from NSObject
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "save", name: UIApplicationWillResignActiveNotification, object: nil)
        
        if let nsFoodItems = NSArray(contentsOfURL: foodItemURL) {
            
            for dict in nsFoodItems {
                if let foodItem = FoodItem(dict: dict as! NSDictionary) {
                    foodItems.append(foodItem)
                }
            }
        }
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        save()
        
    }
    
    func save()
    {
        var nsFoodItems = [AnyObject]()
        
        for item in foodItems {
            nsFoodItems.append(item.plistDict)
        }
        
        if nsFoodItems.count > 0 {
            (nsFoodItems as NSArray).writeToURL(foodItemURL, atomically: true)
        } else {
            do {
                try NSFileManager.defaultManager().removeItemAtURL(foodItemURL)
            } catch {
                print(error)
            }
        }
    }
    // TODO in calculated VAlues ändern !
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
