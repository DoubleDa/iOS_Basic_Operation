

import Foundation

struct Skills: OptionSetType {
    let rawValue:Int
    static let LOL = Skills(rawValue: 1)
    static let GitHub = Skills(rawValue: 1<<1)
    static let Personal = Skills(rawValue: 1<<2)
    static let StackOverflow = Skills(rawValue: 1<<3)
}

struct Programmer {
    var possibleSkills:Skills = [.LOL]
    /**
    由于要在方法里修改结构体中的属性，所以都得加上 mutating 修饰符。三个方法里都使用了 Set 集合的方法来对程序员的技能进行改变。
    */
    mutating func quitLOL(){
        if possibleSkills.contains(.LOL){
            print("不要再玩了，快去写代码吧")
            possibleSkills.subtractInPlace(.LOL)
        }
    }
    mutating func signUpStackOverflow() {
        if !possibleSkills.contains(.StackOverflow) {
            possibleSkills.unionInPlace(.StackOverflow)
            print("StackOverflow 帐号注册完毕，可以上去提问题了")
        } else {
            print("你已经有 StackOverflow 账号了，先去回答几个问题吧")
        }
    }
    mutating func signUpGitHub() {
        if !possibleSkills.contains(.GitHub) {
            possibleSkills.unionInPlace(.GitHub)
            print("GitHub 帐号注册完毕，快去骗 star 吧.")
        } else {
            print("你已经有 GitHub 了，请不要重复注册.")
        }
    }
}

var programmer = Programmer()
programmer.quitLOL()
programmer.signUpGitHub()
programmer.signUpStackOverflow()
