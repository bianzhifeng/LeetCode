

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
    
}
