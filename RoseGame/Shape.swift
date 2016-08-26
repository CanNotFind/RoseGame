//
//  Shape.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/7.
//  Copyright © 2016年 tick. All rights reserved.
//

import SpriteKit

// 定义方向的类型
let NumOrientations:UInt32 = 4

enum Orientation:Int, CustomStringConvertible{
    case Zero = 0, Ninety, OneEighty, TwoSeventy
    
    var description: String{
        switch self {
        case .Zero:
            return "0"
        case .Ninety:
            return "90"
        case .OneEighty:
            return "180"
        case .TwoSeventy:
            return "270"
        }
    }
    
    static func random() -> Orientation{
        return Orientation(rawValue: Int(arc4random_uniform(NumOrientations)))!
    }
    
    static func rotate(orientation: Orientation, clockwise: Bool) -> Orientation{
        var rotated = orientation.rawValue + (clockwise ? 1 : -1)
        if rotated > Orientation.TwoSeventy.rawValue {
            rotated = Orientation.Zero.rawValue
        }
        else if rotated < 0 {
            rotated = Orientation.TwoSeventy.rawValue
        }
        return Orientation(rawValue: rotated)!
    }
    
}


let NumShareType : UInt32   = 7

let FirstBlockIndex: Int    = 0
let SecondBlockIndex: Int   = 1
let ThirdBlockIndex: Int    = 2
let FourthBlockIndex: Int   = 3

class Shape:Hashable, CustomStringConvertible{
    let color:BlockColor
    
    var blocks = Array<Block>()
    
    var orientation: Orientation
    
    var column, row:Int
    
    // 定义一个数组，数组的类型为数组 子数组 key: Orientation的枚举  value:Array<>数组类型， 
    // 定义一个方向+坐标的数据结构
    var blockRowColumnPositions:[Orientation:Array<(columnDiff: Int, rowDiff: Int)>]{
        return [:]
    }
    
    var bottomBlocksForOrientations:[Orientation:Array<Block>]{
        return [:]
    }
    
    var bottomBlocks:Array<Block>{
        if let bottomBlocks = bottomBlocksForOrientations[orientation]{
            return bottomBlocks
        }
        return []
    }
    
    var hashValue: Int{
        //Reduce函数操作会将集合类型里面的所有元素组合成一个新值并返回        
        return blocks.reduce(0) { $0.hashValue ^ $1.hashValue }
    }
    
    // 方块的描述性数据
    var description: String{
        return "\(color) block facing \(orientation): \(blocks[FirstBlockIndex]), \(blocks[SecondBlockIndex]),\(blocks[ThirdBlockIndex]), \(blocks[FourthBlockIndex])"
    }
    
    init( column:Int, row:Int, color:BlockColor, orientation:Orientation){
        self.column = column
        self.row = row
        self.color = color
        self.orientation = orientation
        
        initializeBlocks()
    }
    
    convenience init(column:Int, row:Int){
        self.init(column:column, row: row, color:BlockColor.random(), orientation: Orientation.random())
    }
    
    final func initializeBlocks(){
        if let blockRowColumnTranslations = blockRowColumnPositions[orientation]{
            for i in 0..<blockRowColumnTranslations.count{
                let blockRow = row + blockRowColumnTranslations[i].rowDiff
                let blockColumn = column + blockRowColumnTranslations[i].columnDiff
                let newBlock = Block(column: blockColumn, row: blockRow, color: color)
                blocks.append(newBlock)
            }
            
        }
    }
    
    // 转向
    final func rotateBlocks(orientation: Orientation){
        // 取出对应方向的数据
        if let blockRowColumnTranslation: Array<(columnDiff: Int, rowDiff: Int)> = blockRowColumnPositions[orientation]{
            // 这里原代码是有误的，应该理解为先取出 原始的 数组数据(索引+值)，再取值的x和y ,enumerate 遍历数组数据
            for  (idx,value) in blockRowColumnTranslation.enumerate() {
                blocks[idx].column = column + value.columnDiff
                blocks[idx].row = row + value.rowDiff
            }
        }
    }
    
    // 下降
    final func lowerShapeByOneRow(){
        shiftBy(0, rows:1)
    }
    
    final func shiftBy(columns: Int, rows:Int){
        self.column += columns
        self.row += rows
        for block in blocks{
            block.column += columns
            block.row += rows
        }
    }
    
    final func moveTo(columns:Int, rows:Int){
        self.column += columns
        self.row += rows
        rotateBlocks(orientation)
    }
    
    // 随机一个方块类型
    final class func random(staringColumn:Int , staringrRow:Int)->Shape{
        switch Int(arc4random_uniform(NumShareType)) {
        case 0:
            return SquareShape(column: staringColumn, row: staringrRow)
        case 1:
            return LineShape(column: staringColumn, row: staringrRow)
        case 2:
            return TShape(column: staringColumn, row: staringrRow)
        case 3:
            return LShape(column: staringColumn, row: staringrRow)
        case 4:
            return JShape(column: staringColumn, row: staringrRow)
        case 5:
            return SShape(column: staringColumn, row: staringrRow)
        default:
            return ZShape(column: staringColumn, row: staringrRow)
        }
    }
}

func ==(lhs: Shape, rhs: Shape)->Bool{
    return rhs.column == rhs.column && lhs.row == rhs.row
}





















