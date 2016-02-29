//
//  FoodItemTests.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myMeals

class FoodItemTests: XCTestCase
{
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testInit_ShouldTakeName()
    {
        let item = FoodItem(name: "Test")
        XCTAssertEqual(item.name, "Test", "Name should be set")
    }
    
    func testInit_ShouldTakeNameAndCalories()
    {
        let item = FoodItem(name: "Test", calories: 300)
        XCTAssertEqual(item.calories, 300, "Calories should be set")
    }
    
    func testInit_ShouldTakeNameAndCaloriesAndCarbs()
    {
        let item = FoodItem(name: "Test", calories: 300, carbs: 100)
        XCTAssertEqual(item.carbs, 100, "Calories should be set")
    }

    func testInit_ShouldTakeNameAndCaloriesAndCarbsAndProtein()
    {
        let item = FoodItem(name: "Test", calories: 300, carbs: 100, protein: 50)
        XCTAssertEqual(item.protein, 50, "Protein should be set")
    }
    
    func testInit_ShouldTakeNameAndCaloriesAndCarbsAndProteinAndFat()
    {
        let item = FoodItem(name: "Test", calories: 300, carbs: 100, protein: 50, fat: 30)
        XCTAssertEqual(item.fat, 30, "Fat should be set")
    }
    
    func testEqualItems_ShouldBeEqual()
    {
        let firstItem = FoodItem(name: "Test")
        let secondItem = FoodItem(name: "Test")
        XCTAssertEqual(firstItem, secondItem, "items should be equal")
    }
    
    func testNotEqualItems_ShouldBeNotqual()
    {
        let firstItem = FoodItem(name: "Test")
        let secondItem = FoodItem(name: "Test1")
        XCTAssertNotEqual(firstItem, secondItem, "items should be not equal")
    }
}
