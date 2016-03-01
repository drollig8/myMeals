//
//  FoodItemManagerTests.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myMeals

class FoodItemManagerTests: XCTestCase
{
    var sut: FoodItemManager!
    override func setUp()
    {
        super.setUp()
        sut = FoodItemManager()
    }
    
    override func tearDown()
    {
        sut.removeAll()
        sut = nil
        super.tearDown()
    }
    
    func testFoodItemsCount_Initially_ShouldBeZero()
    {
        XCTAssertEqual(sut.itemCount(),0, "Initially FoodItems should count to zero.")
    }
    
    func testFoodCount_AfterAddingOne_ShouldBeOne()
    {
        let item = FoodItem(name: "Test")
        sut.addItem(item)
        
        XCTAssertEqual(sut.itemCount(), 1, "After adding one should count to one")
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem()
    {
        let item = FoodItem(name: "Test")
        sut.addItem(item)
        
        let returnedItem = sut.itemAtIndex(0)
        
        XCTAssertEqual(returnedItem, item, "After adding one item we should get it back at index 0")
    }
    
    func testRemoveAtIndex_ShouldRemoveItem()
    {
        let item = FoodItem(name: "Test")
        sut.addItem(item)
        
        XCTAssertTrue(sut.itemCount() == 1)
        
        sut.removeItemAtIndex(0)
        
        XCTAssertTrue(sut.itemCount() == 0,"After removing item there should be no item left.")
    }
    
    func testRemoveAllItems_RemovesAllItems()
    {
        let item = FoodItem(name: "Test")
        sut.addItem(item)
        let item1 = FoodItem(name: "Test1")
        sut.addItem(item1)
        
        XCTAssertTrue(sut.itemCount() == 2)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.itemCount() == 0,"After removing item there should be no item left.")
    }
    
    func testThatAddingSameItemTwice_OnlyAddsOne()
    {
        let item = FoodItem(name: "Test")
        sut.addItem(item)
        sut.addItem(item)
        
        XCTAssertTrue(sut.itemCount() == 1,"Should only add item once.")
    }
    
    func test_FoodItemsCanBeSerialized()
    {
        var foodItemManager: FoodItemManager? = FoodItemManager()
        
        let firstItem = FoodItem(name: "FirstItem", calories: 7, carbs: 7, protein: 7, fat: 7)
        foodItemManager?.addItem(firstItem)
        
        let secondItem = FoodItem(name: "SecondItem", calories: 7, carbs: 7, protein: 7, fat: 7)
        foodItemManager?.addItem(secondItem)
        
        NSNotificationCenter.defaultCenter().postNotificationName(UIApplicationWillResignActiveNotification, object: nil)
        
        foodItemManager = nil
        
        XCTAssertNil(foodItemManager)
        
        foodItemManager = FoodItemManager()
        
        XCTAssertEqual(foodItemManager?.itemCount(), 2)
        XCTAssertEqual(foodItemManager?.itemAtIndex(0), firstItem)
        XCTAssertEqual(foodItemManager?.itemAtIndex(1), secondItem)
    }

}
