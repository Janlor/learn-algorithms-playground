import Foundation
import Collections

/* 初始化堆 */
// Swift 的 Heap 类型同时支持最大堆和最小堆，且需要引入 swift-collections
var heap = Heap<Int>()

/* 元素入堆 */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* 获取堆顶元素 */
var peek = heap.max

/* 堆顶元素出堆 */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* 获取堆大小 */
let size = heap.count

/* 判断堆是否为空 */
let isEmpty = heap.isEmpty

/* 输入列表并建堆 */
let heap2 = Heap([1, 3, 2, 5, 4])
