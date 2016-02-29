//
//  LogEntryManager.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

class LogEntryManager
{
    private var logEntries = [LogEntry]()
    
    
    func entryCountForTimeStamp(timestamp: Double, inSection section: Int) -> Int
    {
        let entries = logEntries.filter { $0.section == section && $0.timestamp == timestamp}
        return entries.count
    }
    /*
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
    */
}

