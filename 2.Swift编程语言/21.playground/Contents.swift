//: Playground - noun: a place where people can play

import Cocoa

/**
*  对属性的规定
*/
// 实例属性
protocol YNTestDelegate{
    var mustBeSettable:Int{get set}
    var doesNotNeedToBeSettable: Int{get}
}
// 类属性(class,struct,enum)
protocol AnotherProtocol{
    static var someTypeProperty: Int{get set}
}
protocol FullyNamed{
    var fullName:String{get}
}
struct Person:FullyNamed {
    var fullName:String
}
let john = Person(fullName: "name")
class Starship:FullyNamed {
    var prefix:String?
    var name:String
    init(name:String,prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName:String{
        return (prefix != nil ? prefix! + " ":"") + name
    }
}
var ncct1701 = Starship(name: "Enterprise", prefix: "USS")

/**
*   对方法的规定
*/
protocol SomeProtocol{
    static func someTypeMethod()
}
protocol RandomNumberGenerator{
    func random() ->Double
}
class LinearCongruentialGenerator:RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)%m)
        return lastRandom/m
    }
}
let generator = LinearCongruentialGenerator()
print(generator.random())
print(generator.random())

/**
*  对Mutating方法的规定
*/
protocol Toogle{
    mutating func toggle()
}
enum OneOffSwitch: Toogle{
    case Off,On
    mutating func toggle() {
        switch self{
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch:OneOffSwitch = .Off
lightSwitch.toggle()

/**
*  对构造器的规定
*/
protocol SomeProtocol1{
    init(someParameter:Int)
}
class SomeClass:SomeProtocol1 {
    required init(someParameter: Int){
        
    }
}
protocol SomeProtocol2{
    init()
}
class SomeSuperProtocol {
    init(){
    }
}
class someSubClass:SomeSuperProtocol, SomeProtocol2 {
    required override init() {
        // 同时遵循协议required，继承父类override
    }
}

/**
*  协议类型
*/
class Dice {
    let sides:Int
    let generator:RandomNumberGenerator
    init(sides:Int,generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    func roll() ->Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5{
    print("Random dice roll is \(d6.roll())")
}

/**
*  委托(代理模式)
*/

