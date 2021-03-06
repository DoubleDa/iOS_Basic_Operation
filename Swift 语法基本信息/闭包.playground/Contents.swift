//: Playground - noun: a place where people can play

import UIKit
//closure  是功能性自包含模块，可以在代码中被传递和使用 blocks lambdas 相似
// 闭包可以捕获和存储其所在上下文中任意常量和变量的引用
//全局和嵌套函数实际上也是特殊的闭包
//1. 全局函数是一个有名字但不会捕获任何值的闭包//2. 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包//3. 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的没有名字 的闭包

//  优化
//* 利用上下文推断参数和返回值类型//* 单表达式(single-expression)闭包可以省略 return 关键字
//* 参数名称简写//* Trailing 闭包语法