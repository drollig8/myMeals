//
//  LogEntryTests.swift
//  myMeals
//
//  Created by Marc Felden on 29.02.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myMeals

class LogEntryTests: XCTestCase
{
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    

    func testInit_ShouldTakeTimeStampAndSection()
    {
        let entry = LogEntry(timestamp: 23456677, section: 0)
        
        XCTAssertEqual(entry.timestamp, 23456677, "Timestamp should be set")
        XCTAssertEqual(entry.section, 0, "Timestamp should be set")
    }
    
    func testInit_ShouldTakeTimeStampAndSectionAndAmount()
    {
        let entry = LogEntry(timestamp: 23456677, section: 0, amount:700)
        XCTAssertEqual(entry.amount, 700, "Amount should be set")
    }
    
    func testInit_ShouldTakeTimeStampAndSectionAndAmountAndUnit()
    {
        let entry = LogEntry(timestamp: 23456677, section: 0, amount:700, unit:"g")
        XCTAssertEqual(entry.unit, "g", "Unit should be set")
    }
    
    func testInit_ShouldTakeTimeStampAndSectionAndAmountAndUnitAndFoodItemsArray()
    {
        let entry = LogEntry(timestamp: 23456677, section: 0, amount:700, unit:"g", foodItems:[FoodItem(name: "Test")])
        XCTAssertEqual(entry.foodItems![0].name, "Test", "FoodItems should be set")
    }
    
}
