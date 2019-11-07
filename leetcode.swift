
    
    /**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
    


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var next = 0
        for last in 1..<nums.count {
            if nums[next] != nums[last] {
                nums[next + 1] = nums[last]
                next+=1
            }
        }
        return next + 1
    }
    
    // 189 旋转数组:
    func rotate_1(_ nums: inout [Int], _ k: Int) {
        if 1 >= nums.count { return }
        for i in 0..<k {
            nums.insert(nums[nums.count - 1], at: 0)
            nums.removeLast()
        }
    }
        
    func rotate_2(_ nums: inout [Int], _ k: Int) {
        if 1 >= nums.count { return }
        for i in 0..<k {
            var last = nums[nums.count - 1]
             for j in 0..<nums.count {
                var next = nums[j]
                nums[j] = last
                last = next
            }
        }
    }
        
    func rotate_2(_ nums: inout [Int], _ k: Int) {
        if 1 >= nums.count { return }
        var newNums = [Int]()
        var max = (k > nums.count ? (k - nums.count):k)
        for i in 0..<max {
            var last = nums[nums.count - max + i]
            newNums.append(last)
            nums.remove(at: nums.count - max + i)
        }
        
        newNums.append(contentsOf: nums)
        nums = newNums
    }
    
    /// 21. 合并两个有序链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 递归写法
//         guard var l1 = l1 else {
//             return l2
//         }
        
//         guard var l2 = l2 else {
//             return l1
//         }
        
        // if l1.val < l2.val {
        //     l1.next = mergeTwoLists(l1.next, l2)
        //     return l1
        // } else {
        //     l2.next = mergeTwoLists(l2.next, l1)
        //     return l2
        // }
        
//         首先，我们设定一个哨兵节点 "finalL" ，这可以在最后让我们比较容易地返回合并后的链表。我们维护一个 prev 指针，
// 我们需要做的是调整它的 next 指针。然后，我们重复以下过程，直到 l1 或者 l2 指向了 null ：如果 l1 当前位置的值小于等于 l2 ，
// 我们就把 l1 的值接在 prev 节点的后面同时将 l1 指针往后移一个。否则，我们对 l2 做同样的操作。不管我们将哪一个元素接在了后面，
       // 我们都把 prev 向后移一个元素。
// 在循环终止的时候， l1 和 l2 至多有一个是非空的。由于输入的两个链表都是有序的，所以不管哪个链表是非空的，
     //   它包含的所有元素都比前面已经合并链表中的所有元素都要大。这意味着我们只需要简单地将非空链表接在合并链表的后面，并返回合并链表。

        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        var newL1 = l1
        var newL2 = l2

        var prev = ListNode(-1)
        let finalL = prev

        while (newL1 != nil && newL2 != nil) {
            // 如果newL1的值小于或等于newL2的值
            if newL1!.val <= newL2!.val {
                // 设置next指针
                prev.next = ListNode(newL1?.val ?? -1)
                // 执行自己的下一个节点
                newL1 = newL1?.next
            } else {
                prev.next = ListNode(newL2?.val ?? -1)
                newL2 = newL2?.next
            }
            if let next = prev.next {
                prev = next
            }
        }

        // 判断是否有剩余
        if let newL = newL1 {
            prev.next = newL1
        } else if let newL2 = newL2 {
            prev.next = newL2
        }

        // final为包含初始化-1的链表
        return finalL.next
        
        
    }

}
