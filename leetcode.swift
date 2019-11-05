

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
}