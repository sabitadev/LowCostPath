//
//  File.swift
//  TDD
//
//  Created by Jyoti Karuna Nayak on 2/24/17.
//  Copyright © 2017 Sabita Rani Samal. All rights reserved.
//

import Foundation

class Node {
    
    var data :Int
    var pointX:Int
    var pointY:Int
    var array : [Int] = [Int]()
    
    init()
    {
      data = 0
      pointX = 0
      pointY = 0
    }
}



class Matrix {
    var rows: Int
    var columns: Int
    var grid: [[Int]]
    var pathArr :[Int] = []
   
    var tempGrid:[[Node]]
    var totalCost : Int = LONG_MAX
    
    
    init(rowsArray: [[Int]]) {
        
        rows = rowsArray.count
        columns = rowsArray[0].count
       
      // self.init(rows: rows, columns: columns, repeatedValue: 0)
        
       
       for subArray in rowsArray {
            if subArray.count != columns {
               // assert("Can't create a matrix with different sized columns")
            }
        
        }
        
        grid = rowsArray
        tempGrid = ([[Node]](repeating:[Node](repeating:Node(), count: 2), count: rows))
        
        
    }
    
    func cellCost()->Int
    {
        
        // let grid:[[Int]] = [[3 , 4  ,1  ,2  ,8 ,6],[6 , 1 ,8 , 2 ,7 ,4],[5 ,9 ,3 ,9 ,9 ,5],[8, 4, 1, 3 ,2 ,6],[3 ,7 ,2 ,8 ,6, 4]]
        
        
        let rowNumber = 0
        
        var tempArray = [Node](repeatElement(Node(), count: rows))
        
        var smallnumber :Int
        
        var node :Node = Node()
        
        
        for row in 0...rows-1
        {
            for col in 0...1
            {
                let node = Node()
                node.data = grid[row][col]
                node.pointX = row
                node.pointY = col
                node.array = [Int](repeatElement(0, count: columns))
                node.array[0] = row + 1
                tempGrid[row][col] = node
                
            }
            
        }
        
        
        for col in 1...columns-1
        {
            
            for row in 0...rows-1
            {
                
                tempArray[row] = minimumCost( rowCost: row, column: col)
                
            }
            
            
            for row in 0...rows-1
            {
                tempGrid[row][0] = tempArray[row]
                
                (tempGrid[row][1]).data = grid[row][col]
                
              
            }
            
            
        }
        
        for row in 0...rows-1
        {
            
            
            smallnumber = (tempGrid[row][0]).data
            
            if  smallnumber <= totalCost
            {
                
                //We are adding here last column value for total least cost and path
                totalCost = smallnumber
            
                (tempGrid[row][0]).array[columns - 1] = (tempGrid[row][0]).pointX + 1
                
                node = tempGrid[row][0]
                
            }
            
            
            
        }
        print("arraye\(node.array)")

        print("cost\(totalCost)")
        
        


        return rowNumber
        
        
    }
    func minimumCost(rowCost : Int, column:Int)->Node
    {
        
        
        let col = 0
        let nodeR = tempGrid[rowCost][col]
        let row = nodeR.pointX
        let pointX = (row+1 >= rows) ? 0 : row+1
        let pointY = row
        let pointZ = row-1>=0 ? row-1 : rows-1
        let nodeA = tempGrid[pointX][col+1]
        let nodeB = tempGrid[pointY][col+1]
        let nodeC = tempGrid[pointZ][col+1]
        
        
        let x = minCost(matrix: grid, row : pointX, col:column-1)
        let y = minCost(matrix: grid, row : pointY, col:column-1)
        let z = minCost(matrix: grid, row : pointZ, col:column-1)
        
        let origin = nodeR.data
        var rowNumber = 0
        var nextData = 0
        
        
        if(x<y)
        {
            if(x<z)
            {
                
                rowNumber = pointX
                nextData = nodeA.data
            }
            else
            {
                rowNumber = pointZ
                nextData = nodeC.data
            }
            
        }
        else
        {
            if(y<z)
            {
                rowNumber = pointY
                nextData = nodeB.data
                
            }
            else
            {
                rowNumber = pointZ
                nextData = nodeC.data
            }
        }
        
        nodeR.array[column - 1] = rowNumber + 1
        
        nodeR.data = origin + nextData
        
        nodeR.pointX  = rowNumber
    
        
        return nodeR
        
    }

    
    func minCostEach(x:Int, y:Int, z:Int)->Int
    {
      return min(min(x, y),z)
    }
    
    
    func minCost(matrix:[[Int]], row : Int, col:Int)->Int
    {
        
        if (row < 0 || col < 0)
        {
            return LONG_MAX
        }
        else if ((row == rows-1 && col == columns-1) || (col + 1 >= columns))
        {
            return matrix[row][col]
        }
        else
        {
            
            return matrix[row][col] +
                
                minCostEach(x: minCost(matrix: matrix, row: (row+1 >= rows) ? 0 : row+1,col: col+1),
                            
                            y: minCost(matrix: matrix, row: row,col: col+1),
                            
                            z: minCost(matrix: matrix, row: row-1>=0 ? row-1 : rows-1,col: col+1));
            
            
                  }
        
    }
    
    
    
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
   public subscript(row: Int, column: Int) -> Int{
        get {
            precondition(indexIsValid(row: row, column: column), "Index out of range")
            return grid[row][column]
        }
        set {
            precondition(indexIsValid(row: row, column: column), "Index out of range")
            grid[row][column] = newValue
        }
    }
    

    
}
