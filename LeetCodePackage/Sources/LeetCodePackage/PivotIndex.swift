//
//  PivotIndex.swift
//  LeetCodePackage
//
//  Created by Janlor on 2025/12/25.
//

import Foundation

/// **LeetCode 724 — 寻找数组的中心下标**
///
/// 给你一个整数数组 nums ，请计算数组的 中心下标 。
/// 数组 中心下标 是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。
/// 如果中心下标位于数组最左端，那么左侧数之和视为 0 ，因为在下标的左侧不存在元素。这一点对于中心下标位于数组最右端同样适用。
/// 如果数组有多个中心下标，应该返回 最靠近左边 的那一个。如果数组不存在中心下标，返回 -1 。
///
/// ### 示例 1
///
/// ```
/// 输入：nums = [1, 7, 3, 6, 5, 6]
/// 输出：3
/// 解释：
/// 中心下标是 3 。
/// 左侧数之和 sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11 ，
/// 右侧数之和 sum = nums[4] + nums[5] = 5 + 6 = 11 ，二者相等。
/// ```
///
/// ### 示例 2
///
/// ```
/// 输入：nums = [1, 2, 3]
/// 输出：-1
/// 解释：
/// 数组中不存在满足此条件的中心下标。
/// ```
///
/// ### 示例 3
///
/// ```
/// 输入：nums = [2, 1, -1]
/// 输出：0
/// 解释：
/// 中心下标是 0 。
/// 左侧数之和 sum = 0 ，（下标 0 左侧不存在元素），
/// 右侧数之和 sum = nums[1] + nums[2] = 1 + -1 = 0 。
/// ```
///
/// ### 提示：
/// - 1 <= nums.length <= 104
/// - -1000 <= nums[i] <= 1000
class PivotIndex {
    /// 时间复杂度 O(n)
    /// 空间复杂度 O(1)
    func pivotIndex2(_ nums: [Int]) -> Int {
        let totalSum = nums.reduce(0, +)
        var leftSum = 0
        
        for i in nums.indices {
            if leftSum == totalSum - leftSum - nums[i] {
                return i
            }
            leftSum += nums[i]
        }
        
        return -1
    }
    
    /// ❌ [-1,-1,-1,-1,-1,-1] 无法通过测试
    /// 此题不能用二分法
    func pivotIndex(_ nums: [Int]) -> Int {
        func calcSum(from: Int, to: Int) -> Int {
            var sum = 0
            for i in from...to {
                sum += nums[i]
            }
            return sum
        }
        
        let left = 0
        let right = nums.count - 1
        var mid = left + (right - left) / 2
        
        while mid >= left && mid < right {
            let leftSum = mid - 1 < 0 ? 0 : calcSum(from: left, to: mid - 1)
            let rightSum = mid + 1 > right ? 0 : calcSum(from: mid + 1, to: right)
            guard leftSum != rightSum else {
                return mid
            }
            if nums[mid] > 0 {
                if leftSum < rightSum {
                    mid += 1
                } else {
                    mid -= 1
                }
            } else {
                if leftSum < rightSum {
                    mid -= 1
                } else {
                    mid += 1
                }
            }
        }
        
        return -1
    }
}
