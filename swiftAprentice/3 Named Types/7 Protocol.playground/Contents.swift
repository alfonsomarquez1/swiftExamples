// definig protocols (interface)
protocol Vehicle {
    func accelerate()
    func stop()
}

// conform a protocol
//class Unicycle: Vehicle {}
class Unicycle: Vehicle {
    func accelerate() {
    }
    func stop() {
    }
}

// methods in protocols
enum Direction {
    case Left, Right
}
protocol Vehicle2 {
    func accelerate()
    func stop()
    func turn(direction: Direction)
//    func turn(direction: Direction = .Left)
    func turn()
    func description() -> String
}

// properties in protocols
protocol Vehicle3 {
    var weight: Int { get }
    var name: String { get set }
//    var some = "some"
}

// protocol inheritance
protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}
let bike: WheeledVehicle

// implementing a protocol
protocol Vehicle4 {
    func accelerate()
    func stop()
}
class Bike: Vehicle {
    var peddling = false
    var brakesApplied = false
    func accelerate() {
        peddling = true
        brakesApplied = false
    }
    func stop() {
        peddling = false
        brakesApplied = true
    }
}

// implementing properties
protocol WheeledVehicle2 {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}
class Bike2: WheeledVehicle2 {
    var numberOfWheels: Int {
        return 2
    }
    private var myWheelSize = 16.0
    var wheelSize: Double {
        get {
            return myWheelSize
        }
        set {
            myWheelSize = newValue
        }
    }
}
class Bike3: WheeledVehicle2 {
//    let numberOfWheels = 2  // both valid
    var numberOfWheels = 2
    var wheelSize = 16.0
//    let wheelSize = 16.0
}
var bike2: Bike3 = Bike3()
bike2.numberOfWheels = 16

var wheeledBike: WheeledVehicle2 = bike2
//wheeledBike.numberOfWheels = 4


// typealias
protocol WeightCalculatable {
    associatedtype WeightType
    func calculateWeight() -> WeightType
}
class HeavyThing: WeightCalculatable {
    typealias WeightType = Int
    func calculateWeight() -> Int {
        return 100
    }
}
class LightThing: WeightCalculatable {
    typealias WeightType = Double
    func calculateWeight() -> Double {
        return 0.0025
    }
}
//let b: WeightCalculatable = LightThing()
protocol WeightCalculatable2 {
    associatedtype WeightType
    func calculateWeight() -> WeightType
}
class NormalThing: WeightCalculatable2 {
    typealias WeigthType = Double
    func calculateWeight() -> Double {
        return 1.5
    }
}
//let c: WeightCalculatable2 = NormalThing()

// implementing multiple protocols
protocol Vehicle5 {
    func accelerate()
    func stop()
}
protocol Wheeled {
    var numberOfWheels: Int { get }
}
class Bike4: Vehicle5, Wheeled {
    let numberOfWheels: Int = 2
    func accelerate() {}
    func stop() {}
}

protocol WheeledVehicle3: Vehicle5, Wheeled {}
class Bike5: WheeledVehicle3 {
    let numberOfWheels: Int = 2
    func accelerate() {}
    func stop() {}
}
let bike5: Bike5 = Bike5()
let wheeledBike2: Wheeled = bike5
let vehicleBike: Vehicle5 = bike5
let wheeledVehicleBike: WheeledVehicle3 = bike5

// extension and protocols
protocol WhatType {
    var typeName: String { get }
}
extension String: WhatType {
    var typeName: String {
        return "I'm a String"
    }
}
let myType: String = "Swift"
myType.typeName
class Bike6 { }
extension Bike6: Wheeled {
    // cannot create stored properties only computed properties
    var numberOfWheels: Int {
        return 2
    }
}
extension Bike6: Vehicle5 {
    func accelerate() {    }
    func stop() {    }
}

// classe, structs and enums
protocol Wheeled2 {
    var numberOfWheels: Int { get }
}
class ClassyBike: Wheeled2 {
    let numberOfWheels: Int = 2
}
struct StructyBike: Wheeled2 {
    let numberOfWheels: Int = 2
}
enum EnummyBike: Wheeled2 {
    case Mountain, Road, Tricycle
    var numberOfWheels: Int {
        switch self {
        case .Mountain, .Road:
            return 2
        case .Tricycle:
            return 3
        }
    }
}
var wheels: Wheeled2 = ClassyBike()
wheels.numberOfWheels
wheels = StructyBike()
wheels.numberOfWheels
wheels = EnummyBike.Tricycle
wheels.numberOfWheels

// example
class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
struct Grade {
    let grade: String
    let name: String
    let credit: Double
}
class Student: Person {
    var studentID: Int
    var grades: [Grade] = []
    init(firstName: String, lastName: String, studentID: Int) {
        self.studentID = studentID
        super.init(firstName: firstName, lastName: lastName)
    }
}
protocol TeamMember {
    var role: String { get }
    var firstName: String { get }
    var lastName: String { get }
    func play()
}
class StudentAthlete: Student, TeamMember {
    var sports:[String] = []
    var role: String = "Player"
    func elegible() -> Bool {
        var failed = 0
        grades.forEach { failed += ($0.grade == "F" ? 1: 0) }
        return failed < 2
    }
    func play() {
        if elegible() {
            print("Play the game")
        }
    }
}
class Teacher: Person {}
class Coach: Teacher, TeamMember {
    let role: String = "Coach"
    func play() {
        print("Coach the game!")
    }
}
var roster: [TeamMember] = [Coach(firstName: "Steve", lastName: "Cook"),
StudentAthlete(firstName: "Jane", lastName: "Appleseed", studentID: 34531115),
StudentAthlete(firstName: "Johnny", lastName: "Appleseed", studentID: 09876543)]
func printRoster(roster: [TeamMember]) {
    roster.forEach{
        print("\($0.firstName) \($0.lastName): \($0.role)")
        $0.play()
    }
}
printRoster(roster: roster)

// protocols in the standard library
// equitable & comparable
let a = 5
let b = 5
a == b
let swiftA = "Swift"
let swiftB = "Swift"
swiftA == swiftB
struct Record {
    var wins: Int
    var losses: Int
}
let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)
//recordA == recordB 
//protocol Equatable {
//    func ==(lhs: Self, rhs: Self) -> Bool
//}
extension Record: Equatable {}
func ==(lhs: Record, rhs: Record) -> Bool {
    return lhs.wins == rhs.wins && lhs.losses == rhs.losses
}
recordA == recordB
//protocol Comparable: Equatable {
//    func <(lhs: Self, rhs: Self) -> Bool
//    func <=(lhs: Self, rhs: Self) -> Bool
//    func >=(lhs: Self, rhs: Self) -> Bool
//    func >(lhs: Self, rhs: Self) -> Bool
//}
extension Record: Comparable {}
func <(lhs: Record, rhs: Record) -> Bool {
    let lhsPercent = Double(lhs.wins) / (Double(lhs.wins) + Double(lhs.losses))
    let rhsPercent = Double(rhs.wins) / (Double(rhs.wins) + Double(rhs.losses))
    return lhsPercent < rhsPercent
}
let team1 = Record(wins: 23, losses: 8)
let team2 = Record(wins: 23, losses: 8)
let team3 = Record(wins: 14, losses: 11)
team1 < team2
team1 > team3
team1 <= team2
team1 == team2
team1 != team3
let leagueRecords = [team1, team2, team3]
leagueRecords.sorted()
leagueRecords.max()
leagueRecords.min()
leagueRecords.starts(with: [team1, team2])
leagueRecords.contains(team2)

// hashable
//protocol Hashable: Equatable {
//    var hashValue: Int { get }
//}
extension Student: Equatable {}
func ==(lhs: Student, rhs: Student) -> Bool {
    return lhs.studentID == rhs.studentID
}
extension Student: Hashable {
    var hashValue: Int {
        return studentID
    }
}
let john = Student(firstName: "Johnny", lastName: "Appleseed", studentID: 12345678)
let lockerMap:[Student: String] = [john: "14B"]
let classRoster: Set<Student> = [john, john, john, john]
classRoster.count

// BooealnType
let isSwiftCool = true
if isSwiftCool {
    print("I agree!")
}
//protocol BooleanType {
//    var boolValue: Bool { get }
//}
//extension Record: BooleanType {
//    var boolValue: Bool {
//        return wins > losses
//    }
//}
//if Record(wins: 10, losses: 5) {
//    print("winning!")
//} else {
//    print("losing :(")
//}

// custonStringConvertible
let record = Record(wins: 23, losses: 8)
print(record)
//protocol CustomStringConvertible {
//    var description: String { get }
//}
extension Record: CustomStringConvertible {
    var description: String {
        return "\(wins) - \(losses)"
    }
}

// challenge
protocol Pet {
    func feed()
}
protocol Cleanable {
    func clean()
}
struct Cage: Cleanable {
    var birds: [FlyingPet] = []
    func clean() {
        print("Clean cage")
    }
}
protocol FlyingPet: Pet {
    func cage( cage: inout Cage)
}
struct Tank: Cleanable {
    var fish: [SwimingPet] = []
    func clean() {
        print("Clean tank")
    }
}
protocol SwimingPet: Pet {
    func tank( tank: inout Tank)
}
protocol WalkingPet: Pet {
    func excercise()
}
class Dog: WalkingPet {
    func feed() {
        print("Eating fallen food from the kitchen :p")
    }
    func excercise() {
        print("Excercise, maybe tomorrow")
    }
}
class Fish: SwimingPet {
    func feed() {
        print("Eating worms")
    }
    func tank( tank: inout Tank) {
        tank.fish.append(self)
    }
}
class Mockingbird: FlyingPet {
    func feed() {
        print("Eating seeds")
    }
    func cage( cage: inout Cage) {
        cage.birds.append(self)
    }
}







