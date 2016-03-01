//
//  FoodItemListViewController.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class FoodItemListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    // complaint IBOutlet cannot have non @objc class Type: Make class subclass of NSObject
    @IBOutlet var dataProvider: protocol<UITableViewDataSource,UITableViewDelegate,ItemManagerSettable>!
    //ehemals: @IBOutlet var dataProvider: FoodItemListDataProvider!
    
    var itemManager: FoodItemManager!
    
    override func viewDidLoad()
    {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        dataProvider.foodItemManager = itemManager
        
        // muss auf Notifications hören und den AddAmountVC Instantiieren
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addAmount:", name: "ItemSelectedNotification", object: nil)
    }
    
    @IBAction func addItem(sender: UIBarButtonItem)
    {
        if let nextViewController = storyboard?.instantiateViewControllerWithIdentifier("AddFoodItemViewController") as? AddFoodItemViewController {
            nextViewController.itemManager = self.itemManager
            presentViewController(nextViewController, animated: true, completion: nil)
        }
    }
    
    func addAmount(sender:NSNotification)
    {
        guard let index = sender.userInfo?["index"] as? Int else
        { fatalError() }
        
        if let nextViewController = storyboard?.instantiateViewControllerWithIdentifier(
            "AddAmountViewController") as? AddAmountViewController {
                
                nextViewController.itemInfo = (itemManager, index)
                navigationController?.pushViewController(nextViewController,
                    animated: true)
        }
    }
}


