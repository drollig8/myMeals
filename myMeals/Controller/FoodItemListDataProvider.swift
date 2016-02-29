//
//  FoodItemListDataProvider.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class FoodItemListDataProvider:NSObject, UITableViewDataSource, UITableViewDelegate
{
    
    var foodItemManager: FoodItemManager!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return foodItemManager?.itemCount() ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! FoodItemCell
        let foodItem = foodItemManager.itemAtIndex(indexPath.row)
        cell.configCellWithItem(foodItem)
        return cell
    }
}