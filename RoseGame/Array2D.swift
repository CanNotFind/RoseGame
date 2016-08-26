//
//  Array2D.swift
//  RoseGame
//
//  Created by 吴青 on 16/8/7.
//  Copyright © 2016年 tick. All rights reserved.
//

// 定义一个二维数组
class Arrary2D<T> {
    let columns: Int;
    let rows:Int ;
    
    // 用一维数组存储二维数组的数据
    var arrary: Array<T?>
    
    
    // 初始化这个二维数组 数据
    init(columns: Int, rows: Int){
        self.columns = columns;
        self.rows = rows;
        
        // 初始化这个一维数组，填满nil数据
        arrary = Array<T?>(count: rows * columns, repeatedValue: nil)
        
    }
    
    // 定义数据的下标，将2维数组的数据转换成一维数据
    subscript(column: Int, row: Int)->T?{
        get{
            return arrary[(row * columns) + column];
        }
        set(newValue) {
            arrary[(row * columns) + column] = newValue;
        }
    }
}

