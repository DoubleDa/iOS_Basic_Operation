//: Playground - noun: a place where people can play

import Cocoa

/**
*  语法
*/
struct TimesTable {
    let multiple:Int
    subscript(index:Int) ->Int {
        return multiple * index // onlyread
    }
}
let threeTimesTable = TimesTable(multiple: 3)
print(threeTimesTable[10])

/**
*  用法
*/
var numberOfLegs = ["spider":"8","ant":4]
numberOfLegs["bird"] = 2

/**
*  下表脚本选项-
*/
// 下标脚本允许任意数量的入参索引,并且每个入参类型也没有限制。下标脚本的返回值也可以是任何类型。下标 脚本可以使用变量参数和可变参数,但使用写入读出(in-out)参数或给参数设置默认值都是不允许的
struct Matrix {
    let rows:Int,columns:Int
    var grid:[Double]
    init(rows:Int,columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns , repeatedValue: 0.0)
    }
    // 判断row column 是否越界
    func indexIsValidForRow(row:Int,column:Int) -> Bool{
        return row>=0 && row<rows && column>=0 && column<columns
    }
    
    subscript(row:Int,column:Int) ->Double{
        get{
            // 判断越界
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
// out of range
//let someValue = matrix[2,2]



