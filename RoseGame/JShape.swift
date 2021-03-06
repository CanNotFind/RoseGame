//
//  JShape.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/27.
//  Copyright © 2016年 tick. All rights reserved.
//


class JShape:Shape {
    /*
     
     Orientation 0
     
       • | 0 |
         | 1 |
     | 3 | 2 |
     
     Orientation 90
     
     | 3•|
     | 2 | 1 | 0 |
     
     Orientation 180
     
     | 2•| 3 |
     | 1 |
     | 0 |
     
     Orientation 270
     
     | 0•| 1 | 2 |
     | 3 |
     
     • marks the row/column indicator for the shape
     
     Pivots about `1`
     
     */
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero:       [(1, 0), (1, 1),  (1, 2),  (0, 2)],
            Orientation.Ninety:     [(2, 1), (1, 1),  (0, 1),  (0, 0)],
            Orientation.OneEighty:  [(0, 2), (0, 1),  (0, 0),  (1, 0)],
            Orientation.TwoSeventy: [(0, 0), (1, 0),  (2, 0),  (2, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Ninety:     [blocks[FirstBlockIndex], blocks[SecondBlockIndex], blocks[ThirdBlockIndex]],
            Orientation.OneEighty:  [blocks[FirstBlockIndex], blocks[FourthBlockIndex]],
            Orientation.TwoSeventy: [blocks[FirstBlockIndex], blocks[SecondBlockIndex], blocks[FourthBlockIndex]]
        ]
    }
}