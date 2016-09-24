// motivation
enum PetKind {
    case Cat, Dog
}
struct KeeperKind {
    var keeperOf: PetKind
}
let catKeeper = KeeperKind(keeperOf: .Cat)
let dogKeeper = KeeperKind(keeperOf: .Dog)
enum EnumkeeperKind {
    case CatKeeper, DogKeeper
}
// types defined by other types
struct Cat {}
struct Dog {}
struct KeeperForCats {}
struct KeeperForDogs {}
struct Keeper<T> {}
var aCatKeeper = Keeper<Cat>()
//var aThirdKeeper = Keeper()
struct Cat2 {
    var name: String
}
struct Dog2 {
    var name: String
}
struct Keeper2<T> {
    var name: String
    var morningAnimal: T
    var afternoonAnimal: T
}
let jason = Keeper2(name: "Jason", morningAnimal: Cat2(name: "Whiskers"), afternoonAnimal: Cat2(name: "Sleepy"))
let karen = Keeper2(name: "Karen", morningAnimal: Dog2(name: "Cookie"), afternoonAnimal: Dog2(name: "Thunder"))
//let johnDoe = Keeper2(name: "John Doe", morningAnimal: Cat2(name:"Smuckers"), afternoonAnimal: Dog2(name: "BullsEye"))

// type inference
let favoriteIntsExplicit = Array<Int>(arrayLiteral: 8, 9, 24)
let favoriteIntsInfered = Array(arrayLiteral: 8, 9, 42)
let favoriteFloatsInfered = Array<Float>(arrayLiteral: 8, 9 , 42)
let favoriteIntsExplicit2: Array<Int> = [8, 9, 42]
let favoriteIntsInfered2: Array = [8, 9, 42]
let favoriteFloatsInfered2: Array<Float> = [8, 9, 42]
// struct Dictionary<Key: Hashable, Value> // etc...
let intNames: Dictionary<Int, String> = [42: "forty-two"]
let initNames2: [Int: String] = [42: "forty-two", 7: "seven"]
let initNames3 = [42: "forty-two", 7: "seven"]
// optionals
import Foundation
enum OptionalDate {
    case None
    case Some(NSDate)
}
enum OptionalString {
    case None
    case Some(String)
}
struct Person {
    var birthday: OptionalDate
    var lastName: OptionalString
}
enum Optionals<T> {
    case None
    case Some(T)
}
var birthdate: Optionals<NSDate> = Optionals<NSDate>.None
// implements Equatable
//if birthdate == Optionals<NSDate>.None {
//    // no birthday
//}
var birthdate2: NSDate? = nil
if birthdate2 == nil {
    // no birthday
}

// generic functions
func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    return (y, x)
}
swapped(33, "Jay")

// challenge
