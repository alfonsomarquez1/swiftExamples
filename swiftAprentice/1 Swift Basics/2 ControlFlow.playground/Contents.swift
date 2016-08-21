// if statement
if (2 > 1) {
    print("Yes, 2 is greater than 1.")
}

// else
let animal = "Fox"
if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

// else if
let hourOfDay = 12
let timeOfDay:String
if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "Invalid hour!".uppercaseString
}
print(timeOfDay)

// scope
var hoursWorked = 45
var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25
print(price)
//print(hoursOver40)

// ternary operator
let a = 5
let b = 10
let min = a < b ? a : b
let max = a > b ? a : b

// switch
let number = 10
switch(number)  {
case 10:
    print("Zero")
default:
    break
}

// switch string
let string = "Dog"
switch string {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

// switch multiple values
let houtOfDay2 = 12
let timeOfDay2: String
//print(timeOfDay2)

switch houtOfDay2 {
case  0, 1, 2, 3, 4, 5:
    timeOfDay2 = "Early morning"
case 6, 7, 8, 9, 10, 11:
    timeOfDay2 = "Morning"
case 12, 13, 14, 15, 16:
    timeOfDay2 = "Afternoon"
case 17, 18, 19:
    timeOfDay2 = "Evening"
case 20, 21, 22, 23:
    timeOfDay2 = "Late evening"
default:
    timeOfDay2 = "Invalid hour!".uppercaseString
}
// switch let-where
let number2 = 10
switch number2 {
case let y where y % 2 == 0:
    print("Even")
default:
    print("Odd")
}

// switch tuples
let coordinates: (x: Int, y: Int, z: Int) = (3, 2, 5)
switch coordinates {
case (0, 0, 0):
    print("Origin")
case (_, 0, 0):
    print("On the x-axis")
case (0, _, 0):
    print("On the y-axis")
case (0, 0, _):
    print("On the z-axis")
default:
    print("Somewhere in space")
}

// switch tuples let
let coordinates2: (x: Int, y: Int, z: Int) = (3, 2, 5)
switch coordinates2 {
case (0, 0, 0):
    print("Origin")
case(let x, 0, 0):
    print("On the x-axis at x = \(x)")
case (0, let y, 0):
    print("On the y-axis at y = \(y)")
case (0, 0, let z):
    print("On the z-axis at z = \(z)")
case (let x, let y, let z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

// switch tuple let where
let coordinates3: (x: Int, y: Int, z: Int) = (3, 2, 5)

switch coordinates3 {
case (let x, let y, _) where y == x:
    print("Along the y = x line")
case (let x, let y, _) where y == x * x:
    print("Along the y = x^2 line")
default:
    break
}

class Flowers {}
let tuplaFlowers: (a: Int, b: Int, c: Int, d: Int, e: Int, f: [Int], g: Flowers) = (1, 2, 3, 4, 5, [6,7,8], Flowers())
tuplaFlowers.f[0]
//
//switch tuplaFlowers {
//    case (let a, let b, let c, let d, let e) where a ==
//}

protocol Operacion {
    var value: Double { get }
}
struct Constante: Operacion {
    var value: Double
}
protocol OperacionBinomial: Operacion {
    var ladoIzq: Operacion { get }
    var ladoDerecho: Operacion { get }
}
struct Suma: OperacionBinomial {
    var ladoIzq: Operacion
    var ladoDerecho: Operacion
    var value: Double {
        return ladoIzq.value + ladoDerecho.value
    }
}
struct Resta: OperacionBinomial {
    let ladoIzq: Operacion
    let ladoDerecho: Operacion
    var value: Double {
        return ladoIzq.value - ladoDerecho.value
    }
}

let suma:Operacion = Suma(ladoIzq: Constante(value: 5.0), ladoDerecho: Constante(value: 6.0))
let resta:Operacion = Resta(ladoIzq: Constante(value: 9.0), ladoDerecho: suma)

suma.value
resta.value


