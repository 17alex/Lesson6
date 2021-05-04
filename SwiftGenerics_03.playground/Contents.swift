import UIKit

// MARK: - Задача 3*. К выполнению необязательна. 

indirect enum LinkedList<T> {
    case same(value: T, next: LinkedList<T>)
    case none
}

let l3 = LinkedList<Int>.none
l3
let l2 = LinkedList<Int>.same(value: 2, next: l3)
l2
let l1 = LinkedList<Int>.same(value: 1, next: l2)
l1

let l4 = LinkedList<String>.same(
    value: "1",
    next: LinkedList<String>.same(
        value: "2",
        next: LinkedList<String>.same(
            value: "3",
            next: LinkedList<String>.same(
                value: "4",
                next: LinkedList<String>.none))))

l4
