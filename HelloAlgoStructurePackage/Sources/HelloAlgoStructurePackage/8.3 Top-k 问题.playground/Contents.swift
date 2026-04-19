import Foundation
import Collections

/* 基于堆查找数组中最大的 k 个元素 */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 初始化一个小顶堆，并将前 k 个元素建堆
    var heap = Heap(nums.prefix(k))
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for i in nums.indices.dropFirst(k) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if let min = heap.min, nums[i] > min {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

topKHeap(nums: [1, 7, 6, 3, 2], k: 3)
