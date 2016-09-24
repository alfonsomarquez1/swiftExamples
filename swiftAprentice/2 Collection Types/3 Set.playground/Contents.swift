// explicit declaration
let setOne: Set<Int>

// infered
let setInfered = Set<Int>()
print(setInfered)

// sharing is caring
let someArray = [1, 2, 3, 1]
let someSet: Set<Int> = [1, 2, 3, 1]
let anotherSet: Set = [1, 2, 3, 1]
print(someSet)
print(anotherSet)

// methods and properties
someSet.isEmpty
someSet.count
someSet.contains(1)
someSet.contains(4)
someSet.first

// add and remove
var myTimes: Set = ["8am", "9am", "10am"]
myTimes.insert("11am")
let removedElement = myTimes.remove("8am")
print(myTimes)

// cool fact
func distinct(_ array: [Int]) -> [Int] {
    return [Int](Set<Int>(array))
}
print(distinct([1,1,1,1,2,3,1,4,3,2,2,3,3]))

// iterating
for element in myTimes {
    print(element)
}

// union
let adamTimes: Set = ["9am", "11am", "1pm"]
let unionSet = myTimes.union(adamTimes)

// intersect
let intersectSet = myTimes.intersection(adamTimes)
print(intersectSet)

// subtract
myTimes.subtract(adamTimes)

// exclusiveOr
let exclusiveOrSet = myTimes.symmetricDifference(adamTimes)
print(exclusiveOrSet)

// challenge
let day1: Set = ["Anna", "Benny", "Charlie"]
let day2: Set = ["Anna", "Benny", "Danny"]
let day3: Set = ["Anna", "Danny", "Eric"]

func allAttendances(day1: Set<String>, day2: Set<String>, day3: Set<String>) -> Set<String> {
    return day1.intersection(day2).intersection(day3)
}
print("All Attendances \(allAttendances(day1: day1, day2: day2, day3: day3))")

func dropoutAfterFirstDay(_ day1: Set<String>,_ day2: Set<String>,_ day3: Set<String>) -> Set<String> {
    return day1.symmetricDifference(day2).intersection(day1)
}
print("Dropouts \(dropoutAfterFirstDay(day1, day2, day3))")
