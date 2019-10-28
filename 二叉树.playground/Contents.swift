//: Playground - noun: a place where people can play

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
    }
}

//在二叉树中，节点的层次从根开始定义，根为第一层，树中节点的最大层次为树的深度。
func maxDepth(_ root: TreeNode?) ->Int {
    guard let root = root else {
        return 0
    }
    
    return max(maxDepth(root.left), maxDepth(root.right))
}

// 二叉查找树,  特殊的二叉树, 特点: 左子树节点的值都小于右子树节点的值,右子树中节点的值都大于根节点的值
// 判断一颗二叉树是否为二叉查找树
func isValidBST(_ root: TreeNode?) -> Bool {
    return _helper(node: root, nil, nil)
}

private func _helper(node: TreeNode?, _ min: Int?, _ max: Int?) ->Bool {
    guard let node = node else {
        return true
    }
    // 所有右子节点都必须大于根节点
    if let min = min, node.val <= min {
        return false
    }
    // 所有左子节点都必须小于根节点
    if let max = max, node.val >= max {
        return false
    }
    return _helper(node: node.left, min, node.val) && _helper(node: node.right, node.val, max)
}

// 用栈实现的前序遍历
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node!.left
        }
        else {
            node = stack.removeLast().right
        }
    }
    return res
}

// 二叉树的层级数据
func levelOrder(root: TreeNode?) ->[[Int]] {
    var res = [[Int]]()
    var queue = [TreeNode]()
    
    if let root = root {
        queue.append(root)
    }
    while queue.count > 0 {
        let size = queue.count
        var level = [Int]()
        
        for _ in 0 ..< size {
            let node = queue.removeFirst()
            level.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        res.append(level)
    }
    return res
}

let root = TreeNode(1)
let left1 = TreeNode(2)
let right1 = TreeNode(3)
root.left = left1
root.right = right1

left1.left = TreeNode(4)
left1.right = TreeNode(5)

right1.left = TreeNode(6)
right1.right = TreeNode(7)

print(levelOrder(root: root))
