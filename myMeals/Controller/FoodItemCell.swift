//
//  FoodItemCell.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class FoodItemCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func configCellWithItem(foodItem: FoodItem)
    {
        nameLabel?.text = foodItem.name
        detailLabel?.text = "Cal: \(foodItem.calories), carbs: \(foodItem.carbs), protein: \(foodItem.protein), fat: \(foodItem.fat)"
    }
}
