//: Playground - noun: a place where people can play

import Cocoa

// 构造器
struct Size {
    var width = 0.0
    var height = 0.0
}
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defalutRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
// 扩展构造器
extension Rect{
    // 扩展需要继承原来的方法
    init(center:Point,size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0 ))

// 方法
extension Int{
    func repetiton(task: ()->()){
        for i in 0..<self{
            task()
        }
    }
}
3.repetiton { () -> () in
    print("Hello!")
}
3.repetiton{
    print("aaa")
}


// 修改实例的方法 :
extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()
someInt.repetiton { () -> () in
    print("1")
}

// 下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        // for _ in 0...digitIndex
        for _ in 0...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
746381295[1]
// 如果该Int值没有足够的位数，即下标越界，那么上述实现的下标会返回0，因为它会在数字左边自动补0：
0746381295[9]

// 嵌套类型
// 向已有的class struct enum z中添加新的嵌套类型
extension Character{
     // 新的嵌套枚举
    enum Kind{
        case Vowel
        case Consonant
        case Other
    }
   // 计算实例属性
    var kind:Kind{
        switch String(self).lowercaseString{
            case "a","e","i","o","u":
                return .Vowel
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m","n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                return .Consonant
        default:
            return .Other
            
        }
    }
}






















