//
//  HW4.swift
//  PhoneInputApp
//
//  Created by ARMBP on 7/17/24.
//

import Foundation

//MARK: 1 Task
struct MyStack<Element> {
    private var elements: [Element] = []
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        return elements.popLast()
    }
}

//MARK: 2 Task

class MyQueue<Element> {
    private var elements: [Element] = []
    
    // Метод для добавления элемента в очередь
    public func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    // Метод для удаления элемента из очереди
    public func dequeue() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}


//MARK: 3 Task

protocol MyContainer {
    associatedtype Item
    
    // Метод для добавления элемента
    mutating func add(_ item: Item)
    
    // Метод для удаления элемента
    mutating func remove() -> Item?
}


//MARK: 4 Task

struct MyNewStack<Element>: MyContainer {
    var elements: [Element] = []
    
    mutating func add(_ item: Element) {
        elements.append(item)
    }
    
    mutating func remove() -> Element? {
        return elements.popLast()
    }
    
    typealias Item = Element
}

///

class MyNewQueue<Element>:  MyContainer{
    private var elements: [Element] = []
    
    func add(_ item: Element) {
        elements.append(item)
    }
    
    func remove() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    typealias Item = Element
}

//MARK: 5 Task
func makeOpaque<T: MyContainer>(container: T) -> some MyContainer {
    return container
}

//MARK: 6 Task
final class AnyContainer<Element> {
    
    let _add: (Element) -> Void
    let _remove: () -> Element?
    
    init<C: MyContainer>(_ container: C) where C.Item == Element {
        var containerCopy = container
        
        self._add = { item in
            containerCopy.add(item)
        }
        
        self._remove = {
            return containerCopy.remove()
        }
    }
}

extension AnyContainer: MyContainer {
    func add(_ item: Element) {
        _add(item)
    }
    
    func remove() -> Element? {
        return _remove()
    }
}

//MARK: 7 Task
// Создаем экземпляр Stack с типом данных Int
func useMyStack() {
    var intStack = MyStack<Int>()
    intStack.push(1)
    intStack.push(2)
    intStack.push(3)
    print(intStack.pop() as Any)
    print(intStack.pop() as Any)
    
    // Создаем экземпляр Stack с типом данных String
    var stringStack = MyStack<String>()
    stringStack.push("A")
    stringStack.push("B")
    stringStack.push("C")
    print(stringStack.pop() as Any)
    print(stringStack.pop() as Any)
}

func useMyQueue() {
    // Создаем экземпляр Queue для Int
    let intQueue = MyQueue<Int>()
    intQueue.enqueue(1)
    intQueue.enqueue(2)
    intQueue.enqueue(3)
    print(intQueue.dequeue() ?? "")
    print(intQueue.dequeue() ?? "")
    
    // Создаем экземпляр Queue для String
    let stringQueue = MyQueue<String>()
    stringQueue.enqueue("A")
    stringQueue.enqueue("B")
    stringQueue.enqueue("C")
    print(stringQueue.dequeue() ?? "")
    print(stringQueue.dequeue() ?? "")
}

func useAnyContainerAndMakeOpaque() {
    var stack = MyNewStack<Int>()
    
    // Создаем экземпляр AnyContainer
    let anyContainer = AnyContainer(stack)
    
    // Создаем экземпляр с использованием функции makeOpaque
    let opaqueContainer = makeOpaque(container: stack)
    
    // Добавляем элементы
    anyContainer._add(1)
    anyContainer._add(2)
    anyContainer._add(3)
    
    // Удаляем элементы
    print(anyContainer._remove() as Any)
    print(anyContainer._remove() as Any)
    
}
