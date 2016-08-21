// refreser
var numbers = [1, 2, 3]
numbers.removeLast()
let newArray = numbers

// turning function into a method
func monthsUntilWinterBreak(month: Month) -> Int {
    return Month.December.rawValue - month.rawValue
}
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
    func monthsUntilWinterBreak(month: Month) -> Int {
        return Month.December.rawValue - month.rawValue
    }
}
let month = Month.October
let monthsLeft = month.monthsUntilWinterBreak(month)

// self
enum Month2: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
    func monthsUntilWinterBreak() -> Int {
        return Month.December.rawValue - self.rawValue
    }
}
let month2 = Month2.October
let monthsLeft2 = month2.monthsUntilWinterBreak()

// initializers
enum Month3: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
    init() {
        self = .January
    }
    func monthsUntilWinterBreak() -> Int {
        return Month.December.rawValue - self.rawValue
    }
}
let month3 = Month3()

// initializers in structs and classes
struct Date {
    var month: Month3
    var day: Int
    init() {
        month = .January
        day = 1
    }
    init(month: Month3, day: Int) {
        self.month = month
        self.day = day
    }
}
let date = Date(month: .February, day: 14)
let dateMonth = date.month
let dateDay = date.day
let date2 = Date()
let dateMonth2 = date2.month
let dateDay2 = date2.day

// mutating methods (structs)
struct Date2 {
    var month: Month3
    var day: Int
    init(){
        month = Month3.April
        day = 0
    }
    init(month: Month3, day: Int) {
        self.month = month
        self.day = day
    }
    mutating func advance() {
        day += 1
    }
}

// mutating methods (clases)
class Car {
    let make: String
    private(set) var color:String
    init() {
        make = "Ford"
        color = "Black"
    }
    required init(make: String, color: String) {
        self.make = make
        self.color = color
    }
    func paint(color: String) {
        self.color = color
    }
}
let car = Car(make: "Tesla", color: "Red")
car.paint("Blue")

// typed methods (static)
struct MathUtils {
    static func factorial(number: Int) -> Int {
        return (1...number).reduce(1, combine: *)
    }
    static func triangleNumber(number: Int) -> Int {
        return (1...number).reduce(1, combine: +)
    }
}
let factorial = MathUtils.factorial(6)

// Challenges
import Foundation
class Circle {
    var radius = 0.0
    var area: Double {
        set {
            radius *= sqrt(newValue)
        }
        get {
            return M_PI * radius * radius
        }
    }
    init(radius: Double){
        self.radius = radius
    }
    func growByAFactor(factor: Int) {
        area = Double(factor)
    }
}
let circle = Circle(radius: 1.0)
circle.area
circle.growByAFactor(2)
circle.area
circle.growByAFactor(5)
circle.area






