//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// PreOrder : 從第一個開始印
// PostOrder : 從回頭的 node 開始印
// InOrder :


var array: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ,10 ,11, 12, 13, 14]

func findLeft(index: Int) -> Int {
    return array[2 * index]
}

func findRight(index: Int) -> Int {
    return array[2 * index + 1]
}


enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree, Int, BinaryTree)
    
    private func newTreeWithInsertedValue(newValue: Int) -> BinaryTree {
        switch self {
        // 1
        case .empty:
            return .node(.empty, newValue, .empty)
        // 2
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    mutating func insert(newValue: Int) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    // IN
    func traverseInOrder(process: (Int) -> ()) {
        switch self {
        // 1
        case .empty:
            return
        // 2
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    // PRE
    func traversePreOrder( process: (Int) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    // POST
    func traversePostOrder( process: (Int) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}

var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 9)

//tree.traverseInOrder { print($0) }
//tree.traversePreOrder { print($0) }
//tree.traversePostOrder { print($0) }


/*
 
 
preOrder = [ROOT][LeftTree][RightTree]
postOrder = [LeftTree][RightTree][ROOT]
inOrder = [LeftTree][ROOT][RightTree]
 
 
*/

/*
 
                            Course Example One
 
 
                                    50
                                  /     \
                                 30     70
                                /  \    /  \
                               20   40 60  80
                                    /  /   / \
                                   35 65  75  85
                                                \
                                                90
 
                            Course Example Two
 
                                 50
                                /  \
                               40  70
                               /   / \
                              35  60 80
                                      / \
                                     95 85
                                    / \  \
                                   75 97  90
 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


// Exercise 1

class structure{
    var root: Int
    var left: [Int]?
    var right: [Int]?

    init(_ rootValue: Int) {
        self.root = rootValue
        self.left = nil
        self.right = nil
    }
    
}

//Pre-order: 50 30 20 40 35 70 60 65 80 75 85 90
//In-order: 20 30 35 40 50 60 65 70 75 80 85 90

func getPostorderArray(pre: [Int], inord: [Int]) -> [Int] {
    
    var preorderArray = pre
    var inorderArray = inord
    
    var leftNodes: [Int] = []
    var rightNodes: [Int] = []
    
    
    
    return []
}

func getLeft(){
    
}

func getRighgt(){
    
}

func findRootIndex(in array: [Int], rootValue: Int) -> Int {
    for i in 0..<array.count {
        if array[i] == rootValue {
            return i
        }
    }
    return -1
}



// Exercise 2
func getPreorderArray(post: [Int], in: [Int]) -> [Int] {
    
    
    
    
    return []
}



// TEST




