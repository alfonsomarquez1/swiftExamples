// stored properties - classes, structs
struct  Car {
    let make: String
    let color: String
}
enum Type {
    case Work, Family, Friend
}
struct Contact {
    var fullName: String
    let emailAddress: String
    var type: Type = .Friend
}
var person = Contact(fullName: "Grace Murray", emailAddress: "grace@navy.mil", type: .Friend)
let name = person.fullName
let email = person.emailAddress
person.fullName = "Grace Hooper"
let grace = person.fullName
//person.emailAddress = "grace@gmail.com"

// computed properties - classes, structs, enums
import Foundation
struct TV {
    var height: Double
    var width: Double
    // getter
    var diagonal: Int {
        let aSquared = pow(height, 2)
        let bSquared = pow(width, 2)
        let cSquared = aSquared + bSquared
        let c = sqrt(cSquared)
        let rounded = round(c)
        return Int(rounded)
    }
}
var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal
tv.width = 53.93
let diagonal = tv.diagonal

// getters & setters

struct TV2 {
    var height2: Double
    var width2: Double
    // getter
    var diagonal: Int {
        get {
            return Int(round(sqrt(pow(height2, 2) + pow(width2, 2))))
        }
        set {
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            height2 = Double(newValue) * ratioHeight / sqrt(pow(ratioWidth,2) + pow(ratioHeight, 2))
            width2 = height2 * ratioWidth / ratioHeight
        }
    }
}
var tv2 = TV2(height2: 10, width2: 10)
tv2.diagonal = 70
let height = tv2.height2
let width = tv2.width2

// type properties (static)
struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}
let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)
//let highestLevel = level1.highestLevel
let highestLevel = Level.highestLevel

// singleton
class GameManager {
    static let defaultManager = GameManager()
    var gameScore = 0
    var saveState = 0
    private init() {}
}

// property observers
struct Level2 {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Level.highestLevel {
                Level.highestLevel = id
            }
        }
    }
}

// Limiting a variable
class LightBulb {
    static let maxCurrent = 40
    var currenteCurrent = 0 {
        willSet {
            if newValue > LightBulb.maxCurrent {
                print("Current too high, falling back to previous setting.")
            }
        }
    }
}
var light = LightBulb()
light.currenteCurrent = 50
var current = light.currenteCurrent
light.currenteCurrent = 40
current = light.currenteCurrent

// Lazy properteis
class Circle {
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    var radius = 0.0
    var circumference: Double {
        return pi * radius * 2
    }
    init(radius: Double) {
        self.radius = radius
    }
}
let circle = Circle(radius: 5)
let circumeference = circle.circumference

// Challenges
enum Month {
    case January, February, March, April, May, June, July, August, September, October, November, December
    var schoolSemester: String {
        switch self {
        case .August, .September, .October, .November, .December:
            return "Autumn"
        case .January, .February, .March, .April, .May:
            return "Spring"
        default:
            return "Not in the school year"
        }
    }
}

class IceCream {
    let name = "Plain"
    lazy var ingredients: [String] = {
       return ["sugar", "milk"]
    }()
}







