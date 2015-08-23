//: Playground - noun: a place where people can play

import Foundation

class cacheTool:NSObject {
    // 记录全局的时间
    var globalIndex = 0;
    var cache = 0;
    var window = 0;
    
    init(cache:Int,window:Int) {
        self.cache = cache;
        self.window = window;
    };
    // 使用数组来缓存，数组里面是元组
    var tempArray = [(String,Int,Int)]();
    
    
    // -------------------------------------
    // MARK: 以下为封装的方法：
    
    // get()  method
    func get(index:Int) ->String{
        globalIndex++;
        // 访问的次数 +1
        tempArray[index].1 = tempArray[index].1 + 1
        return tempArray[index].0;
    }
    
    // set() method
    func set(value:String){
        globalIndex++;
        if tempArray.count < cache{
            // 缓存不满直接加到最后
            tempArray.append((value,0,globalIndex));
        }else{
            var min = 0;
            for (idx,val) in EnumerateSequence(tempArray){
                var temV = 1000;
                var temI = 0;
                // 只考虑window之后的这段时间
                if val.2 > window{
                    // 求值
                    if val.1 < temV {
                        temV = val.1;
                        temI = idx;
                    }
                }
                // 记录小标
                min = temI;
            }
            // 替换最近最少使用的   Window-LFU
            tempArray.insert((value,0,globalIndex), atIndex: min);
        }
        
    }
    
    // 删除函数
    func remove(index:Int){
        tempArray.removeAtIndex(index);
    }
    
};
