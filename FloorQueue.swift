//
//  FloorQueue.swift
//  RollGoal
//
//  Created by Brandon Troche on 11/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Node<T>{
    
    var info: T? = nil
    
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init(){
    }
    
    init (info: T){
        self.info = info
    }
}


class FloorQueue<T> {
    
    var size:Int = 0
    
    var head: Node<T> = Node<T>()
    
    var tail: Node<T> = Node<T>()
    
    var currentNode: Node<T> = Node<T>()
    
    init(){}
    
    func isEmpty() -> Bool{
        return self.size == 0
    }
    
    func nextNode(index: Int) -> T? {
        if isEmpty() {
            return nil
        } else if self.size == 1{
            var temp: Node<T> = currentNode
            return temp.info
        } else if index == self.size{
            return currentNode.info
        } else {
            var temp: Node<T> = currentNode
            currentNode = currentNode.next!
            return temp.info
        }
        
    }
    
    func setCurrentNode(){
        currentNode = head
    }
    
    func push(val: T){
        
        var node = Node<T> (info: val)
        
        if self.isEmpty(){
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head.prev = node
            self.head = node
        }
        
        self.size++
    }
    
    func pop() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.size == 1 {
            var temp:Node<T> = self.tail
            self.size--
            return temp.info
        } else {
            var temp: Node<T> = self.tail
            self.tail = self.tail.prev!
            self.size--
            return temp.info
        }
    }
    
    func top() -> T? {
        
        if isEmpty() {
            return nil
        }
        
        return head.info
        
    }
    
    func pull() -> T? {
        
        if isEmpty() {
            return nil
        } else {
            var temp:T = head.info!
            pop()
            return temp
        }
        
    }
    
    func pushVerify(var val: T) -> Bool {
        var didPush:Bool = false
        
        self.push(val)
        didPush = true
        
        return didPush
    }
    
    
    
}