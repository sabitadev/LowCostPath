//
//  TDDTests.swift
//  TDDTests
//
//  Created by Jyoti Karuna Nayak on 2/24/17.
//  Copyright © 2017 Sabita Rani Samal. All rights reserved.
//

import XCTest
@testable import TDD

class TDDTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func sampleOne() {
        
    }
    
    func testExampleOne() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let grid:[[Int]] = [[3 , 4  ,1  ,2  ,8 ,6],[6 , 1 ,8 , 2 ,7 ,4],[5 ,9 ,3 ,9 ,9 ,5],[8, 4, 1, 3 ,2 ,6],[3 ,7 ,2 ,8 ,6, 4]]
        
         let gridOne = [[3 , 4  ,1  ,2  ,8 ,6],[6 , 1 ,8 , 2 ,7 ,4],[5 ,9 ,3 ,9 ,9 ,5],[8, 4, 1, 3 ,2 ,6],[3 ,7 ,2 ,1 ,2, 3]]
        
        let gridTwo = [[19 ,10 ,19 ,10 ,19],[21 ,23, 20 ,19 ,12],[20 ,12 ,20 ,11, 10]]
        
        let gridThree = [[5, 8, 5 ,3 ,5]]
        
        let gridFive = [[5 ,4, "H"],[8, "M" ,7],[5 ,7, 5]]
        
        let gridEight = [[60 ,3, 3 ,6],[6 , 3 , 7 ,9] ,[ 5 ,6 ,8 ,3]]
        
        
        let matrix = Matrix(rowsArray: grid)
        
        let matrix1 = Matrix(rowsArray: gridOne)
        
        let matrix2 = Matrix(rowsArray: gridTwo)
        
        let matrix3 = Matrix(rowsArray: gridThree)
        
        let matrix8 = Matrix(rowsArray: gridEight)
        
        
        let cost = matrix.minCost(matrix: matrix.grid, row: 0, col: 0)
        
        let costOne = matrix1.minCost(matrix: matrix1.grid, row: 0, col: 0)
        
        let costTwo = matrix2.minCost(matrix: matrix2.grid, row: 0, col: 0)
        
        let costThree = matrix3.minCost(matrix: matrix3.grid, row: 0, col: 0)
        
        let costEight = matrix8.minCost(matrix: matrix8.grid, row: 0, col: 0)

        
         XCTAssertEqual(16, cost)
        
        
        
        XCTAssertEqual(11, costOne)
        
      //  XCTAssertEqual(48, costTwo)
        
         XCTAssertEqual(26, costThree)
        
        // XCTAssertEqual(14, costEight)
        
    }

    

    
}
