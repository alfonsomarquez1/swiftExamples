// closure are functions without names that can access variables from the sorrounding context, named after their ability to "close over"

// simple closure
var multiplyClosure: (Int, Int) -> Int
multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}
let result = multiplyClosure(4, 2)

// shorthand syntax
multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

multiplyClosure = { (a: Int, b: Int) in
    a * b
}

multiplyClosure = { (a, b) in
    a * b
}

multiplyClosure = {
    $0 * $1
}

// more examples
func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a,b)
    print(result)
    return result
}

let addClosure = { (a:Int, b: Int) in
    a + b
}

operateOnNumbers(4, 2, operation: addClosure)

func addFunction(_ a: Int, b: Int) -> Int {
    return a + b
}

operateOnNumbers(4, 2, operation: addFunction)

operateOnNumbers(4, 2) { (a: Int, b:Int) -> Int in
    return a + b
}

operateOnNumbers(4, 2, operation:  {
    $0 + $1
})

// trailing closure syntax
operateOnNumbers(4, 2) {
    $0 + $1
}

// no params & no return
let voidClosure: () -> Void = {
    print("Swift is awesome")
}
voidClosure()

// capturing
var counter = 0
let incrementCounter = {
    counter += 1
}

incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

func countingClosure() -> (() -> Int) {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1()
counter2()
counter1()
counter1()
counter1()

