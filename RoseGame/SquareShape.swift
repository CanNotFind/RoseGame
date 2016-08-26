//
//  SquareShape.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/27.
//  Copyright © 2016年 tick. All rights reserved.
//

class SquareShape: Shape{
    
    override var blockRowColumnPositions: [Orientation : Array<(columnDiff: Int, rowDiff: Int)>]{
        return [
            Orientation.Zero:[(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.OneEighty: [(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.Ninety:[(0, 0), (1, 0), (0, 1), (1, 1)],
            Orientation.TwoSeventy:[(0, 0), (1, 0), (0, 1), (1, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation : Array<Block>]{
        return [
            Orientation.Zero:       [blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.OneEighty:  [blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Ninety:     [blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.TwoSeventy: [blocks[ThirdBlockIndex], blocks[FourthBlockIndex]]
        ]

    }
}
