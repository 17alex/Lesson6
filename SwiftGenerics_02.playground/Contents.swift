import UIKit

// MARK: - Задача 2

protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(index: Int) -> Item { get }
}

class LinkedListNode<Element> {
    let value: Element
    var next: LinkedListNode?
    init(value: Element) {
        self.value = value
    }
}

struct LinkendListContainer<Element>: Container {
    
//    typealias Item = LinkedListNode<Element>
    
    var node: LinkedListNode<Element>?
    
    var count: Int {
        
        func counter(node: LinkedListNode<Element>?) {
            if let node = node {
                i += 1
                counter(node: node.next)
            }
        }
        
        var i = 0
        counter(node: node)
        return i
    }
    
    mutating func append(_ newNode: LinkedListNode<Element>) {
        
        func add(node: inout LinkedListNode<Element>?) {
            if let node = node {
                add(node: &node.next)
            } else {
                node = newNode
            }
        }
        
        add(node: &node)
    }
    
    subscript(index: Int) -> LinkedListNode<Element> {
        
        func find(node: LinkedListNode<Element>?) -> LinkedListNode<Element> {
            guard let node = node else { fatalError() }
            if i == index {
                return node
            } else {
                i += 1
                return find(node: node.next)
            }
        }
        
        var i = 0
        return find(node: node)
    }
    
}

var lContainer = LinkendListContainer<String>()
lContainer.count
lContainer.append(LinkedListNode(value: "0"))
lContainer.append(LinkedListNode(value: "1"))
lContainer.count
lContainer[1].value

var rContainer = LinkendListContainer<String>()
rContainer.append(LinkedListNode(value: "2"))
rContainer.append(LinkedListNode(value: "3"))
rContainer.count
rContainer[1].value

lContainer.append(rContainer[0]) // добавляем ноду с нодами (linkendList)
lContainer.count
lContainer[3].value


//--------------------------


struct Queue<Element>: Container {
    
    private var elements: [Element] = []
    
    var count: Int {
        elements.count
    }
    
    mutating func append(_ item: Element) {
        elements.append(item)
    }
    
    mutating func remove() -> Element {
        elements.removeFirst()
    }
    
    subscript(index: Int) -> Element {
        elements[index]
    }
}

var queue = Queue<String>()
queue.count
queue.append("1")
queue.count
queue.append("2")
queue.count
queue.remove()
queue.count
queue.append("3")
queue.count
queue.remove()
queue.count
queue.remove()
queue.count
