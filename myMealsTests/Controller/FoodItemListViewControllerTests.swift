//
//  FoodItemListViewControllerTests.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myMeals

class FootItemListViewControllerTests: XCTestCase
{
    var sut: FoodItemListViewController!
    override func setUp()
    {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("FoodItemListViewController") as! FoodItemListViewController
        _ = sut.view
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad()
    {
        XCTAssertNotNil(sut.tableView, "Table must be set.")
    }
    
    func testViewDidLoad_ShouldSetTableViewDataSource()
    {
        XCTAssertNotNil(sut.tableView.dataSource, "DataSoruce must be set.")
        XCTAssertTrue(sut.tableView.dataSource is FoodItemListDataProvider)
        
        // how to make this testcase work:
        // 1. on viewconrtoller create iboutlet to dataprovider
        // 2. in storyboard add Object to viewcontroller
        // 3. set property of object to dataprovider class
        // 4. outline drag from viewcontroller to dataprovider (left side only) and choose "dataprovider"
        // 5. Make dataprovider conform to UITableViewDataSource
        // set dataprovider as datasource in viewDidLad
        
    }
    
    func testViewDidLoad_ShouldSetTableViewDelegate()
    {
        XCTAssertNotNil(sut.tableView.delegate, "Delegate must be set.")
        XCTAssertTrue(sut.tableView.delegate is FoodItemListDataProvider)
        
    }
    
    // The dataSource & Delegate need to be the same object, otherwise, selecting a cell could result in showing the details of a completely different item
    func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject()
    {
        XCTAssertEqual(sut.tableView.dataSource as? FoodItemListDataProvider, sut.tableView.delegate as? FoodItemListDataProvider, "Should be the same object otherwise could result in data mismatch")
    }
    
    func testItemListViewController_HasAddBarButtonWithSelfAsTarget()
    {
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.target as? UIViewController, sut)
        
        // to get this passed we need to add a button with action
    }
    
    func presentAddFoodItemViewController() -> AddFoodItemViewController
    {
        XCTAssertNil(sut.presentedViewController)
        guard let addButton = sut.navigationItem.rightBarButtonItem else { XCTFail(); fatalError() }
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        sut.performSelector(addButton.action, withObject: addButton)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is AddFoodItemViewController)
        
        return sut.presentedViewController as! AddFoodItemViewController
    }
    func testAddItem_PresentsAddItemViewController()
    {
        let inputViewController = presentAddFoodItemViewController()
        XCTAssertNotNil(inputViewController.nameTextField)
    }
    
    func testItemListVC_SharesItemManagerWithInputVC()
    {
        let inputViewController = presentAddFoodItemViewController()
        XCTAssertEqual(inputViewController.itemManager, sut.itemManager)
    }
    
    func testViewDidLoad_SetsItemManagerToDataProvider()
    {
        XCTAssertTrue(sut.itemManager === sut.dataProvider.foodItemManager)
    }
    
    func testItemSelectedNotification_PushesAddAmountVC()
    {
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        UIApplication.sharedApplication().keyWindow?.rootViewController = mockNavigationController
        _ = sut.view
        sut.itemManager = FoodItemManager()
    NSNotificationCenter.defaultCenter().postNotificationName("ItemSelectedNotification", object: self, userInfo: ["index":0])
        
        // prüfe, dass addAc´mount gepushed urd
        guard let addAmounViewController =  mockNavigationController.topViewController as? AddAmountViewController else {fatalError()}
        
        // check itemManager
        guard let addAmounItemManager = addAmounViewController.itemInfo?.0 else
        { XCTFail(); return }
        
        // check Index of fooditem
        guard let index = addAmounViewController.itemInfo?.1 else
        { XCTFail(); return }
        
        _ = addAmounViewController.view
        
        XCTAssertNotNil(addAmounViewController.nameTextLabel)
        XCTAssertTrue(addAmounViewController === sut.itemManager)
        XCTAssertEqual(index, 1)
        
    }
    
}

extension FootItemListViewControllerTests
{
    class MockNavigationController: UINavigationController
    {
        var pushedViewController: UIViewController?
        override func pushViewController(viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}
