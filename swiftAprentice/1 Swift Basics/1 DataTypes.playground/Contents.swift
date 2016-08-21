// constants
let number: Int = 10
let pi: Double = 3.14159
//number = 0

// variables
var variableNumber: Int = 42
variableNumber = 0
variableNumber = 1_000_000

var integer: Int = 100
let decimal: Double = 12.5
integer = Int(decimal)
let result: Double = Double(integer)

// tuples
let coordinates: (Int, Int) = (2, 3)
let coordinates2: (Double, Double) = (2.1, 3.5)
let coordinates3: (Double, Int) = (2.1, 3)
let x: Int = coordinates.0
let y: Int = coordinates.1

let coordinatesNamed: (xAxis: Int, yAxis: Int) = (2, 3)
let xAxis: Int = coordinatesNamed.xAxis
let yAxis: Int = coordinatesNamed.yAxis

let coordinates3D: (x: Int, y: Int, z: Int) = (2, 3, 1)
//let (x3D, y3D, z3D) = coordinates3D
let x3D = coordinates3D.x
let y3D = coordinates3D.y
let z3D = coordinates3D.z
let (xAxis3D, yAxis3D, _) = coordinates3D

// type inference
let typeInferredInt = 42
let typeInferredDouble = 3.14159

// simple operators
let add = 2 + 6
let subtract = 10 - 2
let multiply = 2 * 4
let divide = 24 / 3
let modulo = 28 % 10
let moduloDecimal = 11.6 % 1.2
let shiftLeft = 1 << 3
let shiftRight = 32 >> 2

// autoincrement

var counter = 1
counter += 1;
counter -= 1
counter *= 3
counter /= 2

// order of operations
let answer = ((8_000 / (5 * 10)) - 32) >> (29 % 5)
let answer2 = 350 / 5 + 2
let answe3 = 350 / (5 + 2)

// operator with mixed types
let hourlyRate = 19.5
let hoursWorked = 10
let totalCost = hourlyRate * Double(hoursWorked)

// comparition operators
let yes: Bool = true
let no: Bool = false
let yes2 = true
let no2 = false

// boolean operators
let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

// boolean logic
let and = true && true
let or = true || false
let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4
let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4
let andOr = (1 < 2 && 3 > 4) || 1 < 4

// string
let hello = "hi"
let world: String = "world"
let letra = "a"
// character
let charactérDog: Character = "🐶"
let char: Character = "!"

// concatenation
var message = "Hello" + " my name is "
let name = "Saty"
message += name
message += String(char)

// string interpolation
let message2 = "Hello my name is \(name)!"
let value = 10
let multiplier = 5
let sum = "\(value) multiplied by \(multiplier) equals \(value * multiplier)"

// string comparition
let comparition = message == message2

// unicode declaration
let textoChino = "电脑编程"
let iDontKnowImNotChinese = "\(UnicodeScalar(30005))\(UnicodeScalar(33041))\(UnicodeScalar(32534))\(UnicodeScalar(31243))"
let 电脑编程 = "I don't know I'm not chinese"
let 💩😀 = "lol"

// grapheme cluster
let graphemeCluster = "cáfé"
let graphemeCluster2 = "ca\(UnicodeScalar(769))fe\(UnicodeScalar(769))"
let compareGraphemeCluster = (graphemeCluster == graphemeCluster2)
graphemeCluster.characters.count
graphemeCluster2.characters.count
let graphemeCluster3 = "\(UnicodeScalar(128077))\(UnicodeScalar(127997))"
let 👍🏽 = "👍🏽\(UnicodeScalar(769))"
let compareGraphemeCluster2 = (graphemeCluster3 == 👍🏽)
graphemeCluster3.characters.count
👍🏽.characters.count
"cigu\u{308}en\u{31f}a"
"cigu\u{308}en\u{370}a".characters.count

// upper and lower case
let string = "Swift is Legend...."
let string2 = "wait for it...."
let string3 = "....dary!".uppercaseString
string
let string2Mayusculas = string2.uppercaseString
string3.lowercaseString
string2
