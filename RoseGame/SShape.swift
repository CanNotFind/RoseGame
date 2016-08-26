//
//  SShape.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/27.
//  Copyright © 2016年 tick. All rights reserved.
//


class SShape:Shape {
    /*
     
     Orientation 0
     
     | 0•|
     | 1 | 2 |
         | 3 |
     
     Orientation 90
     
       • | 1 | 0 |
     | 3 | 2 |
     
     Orientation 180
     
     | 0•|
     | 1 | 2 |
         | 3 |
     
     Orientation 270
     
       • | 1 | 0 |
     | 3 | 2 |
     
     • marks the row/column indicator for the shape
     
     */
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero:       [(0, 0), (0, 1), (1, 1), (1, 2)],
            Orientation.Ninety:     [(2, 0), (1, 0), (1, 1), (0, 1)],
            Orientation.OneEighty:  [(0, 0), (0, 1), (1, 1), (1, 2)],
            Orientation.TwoSeventy: [(2, 0), (1, 0), (1, 1), (0, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[SecondBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Ninety:     [blocks[FirstBlockIndex], blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.OneEighty:  [blocks[SecondBlockIndex], blocks[FourthBlockIndex]],
            Orientation.TwoSeventy: [blocks[FirstBlockIndex], blocks[ThirdBlockIndex], blocks[FourthBlockIndex]]
        ]
    }
}