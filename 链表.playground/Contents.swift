import UIKit

// 链表的节点
class ListNode<T> {
    var val: T
    var next: ListNode?
    
    init(_ val: T) {
        self.val = val
    }
}

// 链表
class LinkedList<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    
    //MARK: 头插法
    func appendAtHead(_ val: T) {
        let node = ListNode(val)
        if let _ = head {
            node.next = head
        }
        else {
            tail = node
        }
        head = node
    }
    
    // 尾插法
    func appendAtTail(_ val: T) {
        let node = ListNode(val)
        if let _ = tail {
            tail!.next = node
        }
        else {
            head = node
        }
        tail = node
    }
}

// 给一个链表和一个值 x，要求将链表中所有小于 x 的值放到左边，所有大于等于 x 的值放到右边。原链表的节点顺序不能变。

//例：1->5->3->2->4->2，给定x = 3。则我们要返回1->2->2->5->3->4
var list: LinkedList = LinkedList<Int>()
list.appendAtTail(1)
list.appendAtTail(5)
list.appendAtTail(3)
list.appendAtTail(2)
list.appendAtTail(4)
list.appendAtTail(2)


func getLeftList(_ head: ListNode<Int>?, _ x: Int) -> ListNode<Int>? {
    let dummy = ListNode(0)
    var pre = dummy, node = head
    while node != nil {
        if node!.val < x {
            pre.next = node
            pre = node!
        }
        node = node!.next
    }
    pre.next = nil
    return dummy.next
}

func partition(_ head: ListNode<Int>?, _ x: Int) -> ListNode<Int>? {
    let prevDummy = ListNode(0)
    let postDummy = ListNode(0)
    var prev = prevDummy, post = postDummy
    var node = head
    
    while node != nil {
        if node!.val < x {
            prev.next = node
            prev = node!
        }else {
            post.next = node
            post = node!
        }
        node = node!.next
    }
    
    post.next = nil
    prev.next = postDummy.next
    return prevDummy.next
    
}

//如何检测一个链表中是否有环？


