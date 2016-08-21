// pizza delivery example
let latitude: Double = 44.9871
let longitude: Double = -93.2758
let range: Double = 200.0

import Foundation

func isInRange(lat: Double, long: Double) -> Bool {
    //Pythagorean theorem
    let difference = sqrt(pow((latitude - lat), 2) + pow((longitude - long), 2))
    let distance = difference * 0.002
    return distance < range
}

// growing
let latitude_1: Double = 44.9871
let longitude_1: Double = -93.2758

let latitude_2: Double = 44.9513
let longitude_2: Double = -93.0942

// hello structs
struct Location {
    let latitude: Double
    let longitude: Double
}
let pizzaLocation = Location(latitude: 44.9871, longitude: -93.2758)

struct DeliveryRange {
    var range: Double
    let center: Location
}
let storeLocation = Location(latitude: 44.9871, longitude: -93.2758)
var pizzaRange = DeliveryRange(range: 200, center: storeLocation)

struct PizzaOrder {
    let toppings: [String]
    let size: Int
}

// accessing members
pizzaRange.range
pizzaRange.center.latitude
pizzaRange.range = 250
//pizzaRange.center.latitude = 20
let constPizzaRange = DeliveryRange(range: 200, center: storeLocation)
//constPizzaRange.range = 250

// initializer
Location(latitude: 44.9871, longitude: -93.2758)

struct Location2 {
    let latitude: Double
    let longitude: Double
    
    // String in GPS format "44.9871,-93.2758"
    init(coordinateString: String) {
        let coordinateSplit = coordinateString.characters.split(",")
        latitude = atof(String(coordinateSplit.first!))
        longitude = atof(String(coordinateSplit.last!))
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
let coords = Location2(coordinateString: "44.9871,-93.2758")
print(coords.latitude)   //  44.9871
print(coords.longitude)  // -93.2758

struct Order {
    var toppings: [String]
    var size: String
    var crust: String
    
    // shadowing
    init(toppings: [String], size: String, crust: String) {
        self.toppings = toppings
        self.size = size
        self.crust = crust
        // self
        // self.crust = "Thin"
        // self.crust
    }
    
    init(size: String, crust: String) {
        self.toppings = ["Cheese"]
        self.size = size
        self.crust = crust
    }
    
    init(special: String) {
        size = "Large"
        crust = "Regular"
        switch special {
        case "Veggie":
            toppings = ["Tomatoes", "Green Pepper", "Mushrooms"]
        case "Meat":
            toppings = ["Sausage", "Pepperoni", "Ham", "Bacon"]
        default:
            toppings = ["Cheese"]
        }
    }
}

// intializers rules
struct ClimateControl {
    var temperature: Double = 68.0
    var humidity: Double?
    
    init(){}
    
    init(temp: Double) {
        temperature = temp
    }
    
    init(temp: Double, hum: Double) {
        temperature = temp
        humidity = hum
    }
}
let ecoMode = ClimateControl(temp: 75.0)
let dryAndComfortable = ClimateControl(temp: 71.0, hum: 30.0)
let defaultClimate = ClimateControl()

let pizzaJoints = [
    DeliveryRange(range: 200, center: Location(latitude: 44.9871, longitude: -93.2758)),
    DeliveryRange(range: 200, center: Location(latitude: 44.9513, longitude: -93.0942))
]

// methods
func isInRange3(customer: Location) -> Bool {
    for pizzaRange in pizzaJoints {
        let difference = sqrt(pow(pizzaRange.center.latitude - customer.latitude, 2) + pow((pizzaRange.center.longitude - customer.longitude), 2))
        if difference < pizzaRange.range {
            return true
        }
    }
    return false
}
let customer = Location(latitude: 44.9871, longitude: -93.2758)
print(isInRange3(customer))

struct DeliveryRange2 {
    var range: Double
    let center: Location2
    
    func isInRange(customer: Location2) -> Bool {
        let difference = sqrt(pow(latitude - center.latitude, 2) + pow(longitude - center.longitude, 2))
        return difference < range
    }
}

let range2 = DeliveryRange2(range: 150, center: Location2(coordinateString: "44.9871,-93.2758"))
let customer2 = Location2(coordinateString: "44.9850,-93.2750")
range2.isInRange(customer2)

// extensions
extension Location2 {
    func isNothernHemisphere() -> Bool {
        return latitude > 0.0
    }
}
let location = Location2(coordinateString: "44.9850,-93.2750")
location.isNothernHemisphere()

extension String {
    func evenOrOdd() -> String {
        return characters.count % 2 == 0 ? "Even!" : "Odd!"
    }
}
"I'm odd".evenOrOdd()

// structs are value types
var a: Int = 5
var b: Int = a
a = 10
print(a)
print(b)

var range3: DeliveryRange2 = DeliveryRange2(range: 200, center: Location2(coordinateString: "44.9871,-93.2758"))
var range4: DeliveryRange2 = range3
range3.range = 100
print(range3.range)
print(range4.range)

// Structs are primitive types of Swift

// challenge battleship 





