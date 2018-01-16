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

//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}


// Exercise 1

//Pre-order: 50 30 20 40 35 70 60 65 80 75 85 90
//In-order: 20 30 35 40 50 60 65 70 75 80 85 90



class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init (value: Int) {
        self.value = value
    }
}

class BTree {
    
    var preIndex = 0
    var postIndex = 10
    
    func buildTree(inorder: [Int], preorder: [Int], inStart: Int, inEnd: Int) -> Node? {
        
        if inStart > inEnd {
            return nil
        }
        
        let tNode = Node(value: preorder[preIndex])
        preIndex += 1
        
        if inStart == inEnd {
            return tNode
        } else {
            let inIndex = search(arr: inorder, start: inStart, end: inEnd, value: tNode.value)
            tNode.left = buildTree(inorder: inorder, preorder: preorder, inStart: inStart, inEnd: inIndex - 1)
            tNode.right = buildTree(inorder: inorder, preorder: preorder, inStart: inIndex + 1, inEnd: inEnd)
            return tNode
        }
    }
    
    func buildTree(inorder: [Int], postorder: [Int], inStart: Int, inEnd: Int) -> Node? {
        if inStart > inEnd {
            return nil
        }
        
        let tNode = Node(value: postorder[postIndex])
        postIndex -= 1
        
        if inStart == inEnd {
            return tNode
        } else {
            let inIndex = search(arr: inorder, start: inStart, end: inEnd, value: tNode.value)
            tNode.left = buildTree(inorder: inorder, postorder: postorder, inStart: inStart, inEnd: inIndex - 1)
            tNode.right = buildTree(inorder: inorder, postorder: postorder, inStart: inIndex + 1, inEnd: inEnd )
            return tNode
        }
    }
    
    func search(arr: [Int], start: Int, end: Int, value: Int) -> Int {
        for i in start...end {
            if arr[i] == value {
                return i
            }
        }
        return start
    }
    
    func printOrder(node: Node?) {
        if let n = node {
            print (n.value)
            printOrder(node: n.left)
            printOrder(node: n.right)
        }
    }
    
}

let bTree = BTree()

//let preOrder: [Int] = [50, 30, 20, 40, 35, 70, 60, 65, 80, 75, 85, 90]
//let inorder: [Int] = [20, 30, 35, 40, 50, 60, 65, 70, 75, 80, 85, 90]


let inorder: [Int] = [35, 40, 50, 60, 70, 75, 80, 85, 90, 95, 97 ]
let postorder: [Int] = [35, 40, 60, 75, 97, 95, 90, 85, 80, 70, 50]

let count: Int = inorder.count


//let root = bTree.buildTree(inorder: inorder, preorder: preOrder, inStart: 0, inEnd: count - 1)
//bTree.printOrder(node: root)

let root = bTree.buildTree(inorder: inorder, postorder: postorder, inStart: 0, inEnd: count - 1)
bTree.printOrder(node: root)

