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
        print(sut.navigationItem.rightBarButtonItem?.target)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem?.target as? UIViewController, sut)
        
        // to get this passed we need to add a button with action
    }
    
    func testAddItem_PresentsAddItemViewController()
    {
        
    }
    
}
