//: Playground - noun: a place where people can play

import Cocoa


// 字典是一个可选类型

/**
*  读取和修改字典
*/
var dictionary:[String:String] = ["Dublin Airport":"DUB1"]
// 返回oldValue 没有值返回nil
var oldValue = dictionary.updateValue("DU", forKey: "Dublin Airport")
// 从字典里移除键值对
dictionary["Dublin Airport"] = nil
// 返回value 没有返回nil
var removeValue = dictionary["Dublin Airport"]

/**
*  字典遍历
*/
// Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值,可以对字典的 keys 或 values 属性使 用 sort() 方法。
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
for (value,key) in airports{
    print("airportCode:\(value),airportName:\(key)")
}
for airportName in airports.keys{
    print(airportName)
}
for airportCode in airports.values{
    print(airportCode)
}
let airportCodes = Array(airports.keys)
let airportNames = Array(airports.values)