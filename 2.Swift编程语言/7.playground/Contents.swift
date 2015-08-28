//: Playground - noun: a place where people can play

import Cocoa

var names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backwards(s1:String,s2:String) -> Bool{
    return s1 > s2
}
var reverse = names.sort(backwards)

// 内联闭包表达式
reverse = names.sort({(s1:String,s2:String) -> Bool in
    return s1>s2
})
// 上下文推断参数
// 通过内联闭包表达式构造的闭包作为参数传递给函数时
reverse = names.sort({s1,s2 in return s1>s2})

// 单表达式闭包隐式返回
reverse = names.sort({s1,s2 in s1 > s2 })
//参数缩写
reverse = names.sort({$0 > $1})
//运算符函数
reverse = names.sort(>)

// 尾随闭包
let digitNames = [0:"Zero",1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]
let numbers = [16,58,510]
let strings = numbers.map { (var number) -> String in
    var output = ""
    while(number>0){
        // 字典下标返回一个可选值
        output = digitNames[number%10]! + output
        number /= 10
    }
    return output
}

// 捕获值
// 函数返回类型为函数类型 ()->Int
func makeIncrementor(forIncrement amount:Int) -> ()->Int{
    var runningTotal = 0
    func incrementor()->Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven
incrementByTen

//  闭包时引用类型
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen // 50


