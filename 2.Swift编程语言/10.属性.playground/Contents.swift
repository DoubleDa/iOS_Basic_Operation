//: Playground - noun: a place where people can play

import Cocoa

struct Point{
    var x = 0.0
    var y = 0.0
}
struct Size {
    var witdh = 0.0
    var height = 0.0
}
struct Rectangle {
    var origin = Point()
    var size = Size()
    // 计算属性
    var center:Point{
        get{
            let centerX = origin.x + size.witdh/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.witdh/2)
            origin.y = newCenter.y - (size.height/2)
        }
//        set {
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
    }
}

var square = Rectangle(origin: Point(x: 0.0, y: 0.0), size: Size(witdh: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0 )
//只读计算属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    // 只读计算属性
    var volume: Double {
        return width * height * depth
    }
}

//3.属性观察者
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

class StepCounter {
    var totalSteps:Int = 0{
        willSet{
            print(newValue)
        }didSet{
            if totalSteps > oldValue{
                print((totalSteps - oldValue))
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// 类型属性语句 计算属性
struct SomeStructures{
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty:Int{
        return 121
    }
}
enum SomeEnumeration{
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty:Int{
        return 122
    }
}
// 类计算属性使用class 存储属性 static class 都行
class SomeClass {
    class var computedTypeProperty: Int {
        return 123
    }
}
print(SomeClass.computedTypeProperty)
print(SomeStructures.storedTypeProperty)
SomeStructures.storedTypeProperty = "another value"
print(SomeStructures.storedTypeProperty)
print(SomeClass.computedTypeProperty)
// 存储属性
struct AudioChannel{
    // 存储类型属性
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    // 存储实例属性
    var currentLevel:Int = 0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel{
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}
var left = AudioChannel()
var right = AudioChannel()
print(left.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)
right.currentLevel = 11
print(right.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)
// 如果像设置右通道的currentlevel为11，它的值将被截短成为10，而且maxInputLevelForAllChannels的值也将更新为10:




