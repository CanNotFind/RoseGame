//
//  TShape.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/27.
//  Copyright © 2016年 tick. All rights reserved.
//


class TShape: Shape{
    /*
     orientation 0
     *  |0|
     |1||2||3|
     
     orientation 90
     *  |1|
     |2||0|
        |3|
     
     orientation 180
     *                    or             *
     |3||2||1|                           |1||2||3|
        |0|                                 |0|
     
     orientation 270
     *  |3|               or             *    |1|
     |0||2|                                |0||2|
        |1|                                   |3|
     
     * marks the row/column indicator for the shape
     */
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff:Int, rowDiff: Int)>]{
        return [
            Orientation.Zero : [(1,0),(0,1),(1,1),(2,1)],
            Orientation.Ninety : [(2,1),(1,0),(1,1),(1,2)],
            Orientation.OneEighty : [(1,2),(2,1),(1,1),(0,1)],
            Orientation.TwoSeventy : [(0,1),(1,2),(1,1),(1,0)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>]{
        return [
            Orientation.Zero : [blocks[SecondBlockIndex],blocks[ThirdBlockIndex],blocks[FourthBlockIndex]],
            Orientation.Ninety : [blocks[FirstBlockIndex],blocks[FourthBlockIndex]],
            Orientation.OneEighty : [blocks[FirstBlockIndex],blocks[SecondBlockIndex],blocks[FourthBlockIndex]],
            Orientation.TwoSeventy : [blocks[FirstBlockIndex],blocks[SecondBlockIndex]]
        ]
    }
    
    
}