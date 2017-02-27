//
//  ViewController.swift
//  TDD
//
//  Created by Jyoti Karuna Nayak on 2/24/17.
//  Copyright © 2017 Sabita Rani Samal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // let grid:[[Int]] = [[3 , 4  ,1  ,2  ,8 ,6],[6 , 1 ,8 , 2 ,7 ,4],[5 ,9 ,3 ,9 ,9 ,5],[8, 4, 1, 3 ,2 ,6],[3 ,7 ,2 ,8 ,6, 4]]
        
        let grid = [[3 , 4  ,1  ,2  ,8 ,6],[6 , 1 ,8 , 2 ,7 ,4],[5 ,9 ,3 ,9 ,9 ,5],[8, 4, 1, 3 ,2 ,6],[3 ,7 ,2 ,1 ,2, 3]]
        
        let matrix = Matrix(rowsArray: grid)
        
          print(matrix.cellCost())
        
       // let cost = matrix.minCost(matrix: matrix, row: 0, col: 0)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

