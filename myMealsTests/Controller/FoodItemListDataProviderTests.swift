//
//  FoodItemListDataProviderTests.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myMeals

class FoodItemListDataProviderTests: XCTestCase
{
    var sut: FoodItemListDataProvider!
    var tableView: UITableView!
    var controller: FoodItemListViewController!
    
    override func setUp()
    {
        super.setUp()
        
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        
        controller = storyboad.instantiateViewControllerWithIdentifier("FoodItemListViewController") as! FoodItemListViewController
        
        sut = FoodItemListDataProvider()
        
        _ = controller.view
        
        tableView = controller.tableView
        tableView.dataSource = sut
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testNumberOfSections_IsOne()
    {
        let section = tableView.numberOfSections
        
        XCTAssertTrue(section == 1,"We want One Sections") // LogEntries have 6
    }
    
    // add itemManager Property to DataProvider
    
    func testNumberOfRowsInFirstSection_IsFoodItemCount()
    {
        sut.foodItemManager = FoodItemManager()
        sut.foodItemManager.addItem(FoodItem(name: "Test"))
        print(sut.foodItemManager)
        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), 1, "")
    }
    
    
    /*
    Zitat:
    At this point, it is not clear who is going to set the item manager to itemManager. We will decide this in a later chapter when we put all the modules together to form a complete app. For the test, we will set itemManager in them.
    
    */
    
    func testRow_ReturnsItemCell()
    {
        sut.foodItemManager = FoodItemManager()
        sut.foodItemManager.addItem(FoodItem(name: "Test"))
        tableView.reloadData()
        
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        
        XCTAssertTrue(cell is FoodItemCell)
        
    }
    
    func testCellForRow_DequeuesCell()
    {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.registerClass(FoodItemCell.self, forCellReuseIdentifier: "Cell")
        
        sut.foodItemManager = FoodItemManager()
        sut.foodItemManager.addItem(FoodItem(name: "Test"))
        
        mockTableView.reloadData()
        _ = mockTableView.cellForRowAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func testConfigCell_GetsCalledInCellForRow()
    {
        let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 460), style: .Plain)
        mockTableView.dataSource = sut
        mockTableView.registerClass(MockFoodItemCell.self, forCellReuseIdentifier: "Cell")
        
        sut.foodItemManager = FoodItemManager()
        let foodItem = FoodItem(name: "Test")
        sut.foodItemManager.addItem(foodItem)
        
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRowAtIndexPath(NSIndexPath(forItem: 0, inSection: 0)) as! MockFoodItemCell!
        XCTAssertEqual(cell.foodItem, foodItem)
    }
}

extension FoodItemListDataProviderTests
{
    class MockTableView: UITableView
    {
        var cellGotDequeued = false
        override func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        }
    }
    
    class MockFoodItemCell: FoodItemCell
    {
        var foodItem: FoodItem?
        override func configCellWithItem(foodItem: FoodItem) {
            self.foodItem = foodItem
        }
    }
}
