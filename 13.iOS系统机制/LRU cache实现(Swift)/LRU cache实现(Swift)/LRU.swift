//
//  Entry.swift
//  LRU cache实现(Swift)
//
//  Created by 游义男 on 15/9/10.
//  Copyright © 2015年 游义男. All rights reserved.
//

// the use of HashTable

import Foundation

// 节点，，前一个，后一个，key value
class Node<K,V> {
    var next:Node?
    var previous:Node?
    var key:K
    var value:V?
    
    init(key:K,value:V?){
        self.key = key
        self.value = value
    }
}

// 动态链表  Node<K,V> 与 Node 的区别
class LinkList<K,V> {
    var head:Node<K,V>?
    var tail:Node<K,V>?
    
    init(){
    
    }
    
    func addToHead(node:Node<K,V>) {
        if self.head == nil{
            self.head = node
            self.tail = node
        }else{
            var temp = self.head
            
            self.head?.previous = node
            self.head = node
            self.head?.next = temp
        }
    }
    
    func remove(node:Node<K,V>){
        if node === self.head{
            if self.head?.next != nil {
                self.head = self.head?.next
                self.head?.previous = nil
            }else{
                self.head = nil
                self.tail = nil
            }
        }else if (node.next != nil){
            node.previous?.next = node.next
            node.next?.previous = node.previous
        }else{
            node.previous?.next = nil
            self.tail = node.previous
        }
    }
    
    func display() -> String{
        var description:String = ""
        var current = self.head
        
        while current != nil {
            description += "Key:\(current!.key) Value: \(current?.value) \n"
            
            current = current?.next
        }
        return description
    }
    
}

class LRU <K:Hashable,V> :CustomStringConvertible {
    let capacity:Int
    var length = 0
    private let queue:LinkList<K,V>
    private var hashtable:[K:Node<K,V>]
    
    init(capacity:Int){
        self.capacity = capacity
        self.queue = LinkList()
        self.hashtable = [K:Node<K,V>](minimumCapacity: self.capacity)
    }
    subscript (key: K) -> V? {
        get {
            if let node = self.hashtable[key] {
                self.queue.remove(node)
                self.queue.addToHead(node)
                
                return node.value
            } else {
                return nil
            }
        }
        
        set(value) {
            if let node = self.hashtable[key] {
                node.value = value
                
                self.queue.remove(node)
                self.queue.addToHead(node)
            } else {
                var node = Node(key: key, value: value)
                
                if self.length < capacity {
                    self.queue.addToHead(node)
                    self.hashtable[key] = node
                    
                    self.length++
                } else {
                    hashtable.removeValueForKey(self.queue.tail!.key)
                    self.queue.tail = self.queue.tail?.previous
                    
                    if let node = self.queue.tail {
                        node.next = nil
                    }
                    
                    self.queue.addToHead(node)
                    self.hashtable[key] = node
                }
            }
        }
    }
    var description:String{
        return "LRU Cache(\(self.length)) \n" + self.queue.display()
    }
}




















