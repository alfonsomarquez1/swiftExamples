// simple function
func printMyName() {
    print("My name is Saty boy")
}
printMyName()

// function with parameters
func printMultipleOfFive(multiplier: Int) {
    print("\(multiplier) * 5 = \(multiplier * 5)")
}
printMultipleOfFive(10)

// serveral parameters
func printMultipleOf(multiplier: Int, andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(4, andValue: 2)

// internal and external names
func printAlsoMultipleOf(multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printAlsoMultipleOf(4, and: 2)

// no external name
func printJustMultipleOf(mult multiplier: Int, _ value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printJustMultipleOf(mult: 4, 2)

// default values
func printDefaultMultipleOf(multiplier: Int, and value: Int = 1) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printDefaultMultipleOf(4)
printDefaultMultipleOf(5, and: 5)

// return
func multiply(number: Int, by byValue: Int) -> Int {
    return number * byValue
}
let result = multiply(4, by: 2)

// return tuple
func multiplyAndDivide(number: Int, by byValue: Int) -> (multiply: Int, divide: Int) {
    return (number * byValue, number / byValue)
}
let result2 = multiplyAndDivide(4, by: 2)
let (multiply, divide) = result2
let justMultiply = multiply

// parameters by default are constants / pass by value
func incrementAndPrint(value: Int) {
//    value += 1
    print(value)
}

// pass by reference
func incrementAndPrintInOut(inout value: Int) {
    value += 1
    print(value)
}
var value = 5
incrementAndPrintInOut(&value)
//incrementAndPrintInOut(value)
print(value)

// standard libreary functions examples
let maxInt = max(10, 20)
let minInt = min(10, 20)
let absInt = abs(-10)

// functions as variables
func add(a:Int, _ b: Int) -> Int {
    return a + b
}
var functionVariable: (Int, Int) -> Int = add
let result3 = functionVariable(4, 2)

func subtract(a: Int, _ b: Int) -> Int {
    return a - b
}
functionVariable = subtract
let resul4 = functionVariable(4, 2)

// functions as parameters
func printResult(functionVariable: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = functionVariable(a, b)
    print(result)
}
printResult(add, 4, 2)
