//: Playground - noun: a place where people can play

import Cocoa

/**
*   数组的filter方法
*/
var str = [Int]()
// for i in 1 ..< 10
for (var i = 1 ;i<10; i++){
    if i % 2 == 0 {
        str.append(i)
        print(i)
    }
}
print(str)
//复用
func evenNumber(number:Int) ->Bool {
    return (number%2)==0
}
let arr = Array(1...10).filter(evenNumber)
let array = Array(1...12).filter({(number:Int) -> Bool in
    return number%2 == 0
})
let array1 = Array(1...12).filter{$0%2 == 0}

func myFilter<T>(source:[T],predicate:(T)-> Bool) ->[T]{
    var result = [T]()
    for i in source {
        if predicate(i){
            result.append(i)
        }
    }
    return result
}
myFilter(str) { (number) -> Bool in
    return number % 2 == 0
}

/**
*   数组的了reduce方法
*/
let sum = Array(1...10).filter{$0 % 2 == 0}.reduce(0) { (total, number) in
    total + number
}
let maxNumber = Array(1...10).filter{$0 % 2 == 0}.reduce(0) { (theMax, number) in
    return theMax > number ? theMax:number
}
print(maxNumber)

extension Array {
    func myReduce<T,U>(seed: U,combiner:(U,T) -> U) -> U{
        var current = seed
        for item in self {
            current = combiner(current,item as! T)
        }
        return current
    }
}

let test = Array(0...10).filter{$0%2 == 0}.myReduce(0) { (max, number) in
    return max>number ? max :number
}

/**
*  数组的map方法
*/
var arrMap = Array(1...10).map { (money) -> String in
    return "\(money)?"
}

// indexOf
var language:Array = ["A","B","C"]
language.indexOf("A")
language.indexOf { (n) -> Bool in
    return n < "b"
}

//
