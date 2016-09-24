// hello class
class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}
let john = Person(firstName: "Jhonny", lastName: "Appleseed")
john.fullName()


// references
var johnRef = Person(firstName: "Jhonny", lastName: "Appleseed")
var homeOwner = johnRef
johnRef.firstName = "John"
johnRef.firstName
homeOwner.firstName

// identity
//print(johnRef == homeOwner)
print(johnRef === homeOwner)
var imposter = Person(firstName: "John", lastName: "Appleseed")
print(imposter === homeOwner)
homeOwner = imposter
print(johnRef === homeOwner)
print(imposter === homeOwner)

func memberOf(_ person: Person, group: [Person]) -> Bool {
    var isMember = false
    for member in group {
        if member === person {
            isMember = true
            break
        }
    }
    return isMember
}
print(memberOf(john, group: [johnRef, imposter, homeOwner, john]))

// methods and mutability
struct Grade {
    let letter: String
    let points: Double
    var credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade]
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        grades = []
    }
    func record(grade: Grade) {
        grades.append(grade)
    }
    func gradePointAverage() -> Double {
        var points = 0.0
        var credits = 0.0
        for grade in grades {
            points += grade.points
            credits += grade.credits
        }
        return points/credits
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)
jane.record(grade: history)
jane.record(grade: math)

// access control: public, internal, private
public var publicString: String = "Everyone can see me!"
internal class InternalClass {
    private func sayHi() {
        print("Hi!")
    }
    // internal by defaukt
    func speak() {
        sayHi()
    }
}

print(publicString)
let myClass = InternalClass() // Build error, if you'r outside InternalClass module
//myClass.sayHi()  Build error, if you'r outside InternalClass file
myClass.speak() // "Hi!"

class Student2 {
    var firstName: String
    var lastName: String
    private var grades: [Grade]
    var credits: Double
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        grades = []
        credits = 0.0
    }
    func recordGrade(grade: Grade) {
        if grades.contains(where: { $0.letter == "F"}) {
            // Second F! Double-secret probation!
        }
        grades.append(grade)
        credits += grade.credits
    }
}

let jane2 = Student2(firstName: "Jane", lastName: "Appleseed")
let history2 = Grade(letter: "B", points: 9.0, credits: 3.0)
jane2.recordGrade(grade: history2)
//jane2.grades.append(history2) Build Error! I written outside this file
var math2 = Grade(letter: "F", points: 16.0, credits: 2.0)
jane2.recordGrade(grade: math2) // Double secret probation
//jane2.grades.append(math2)  Sneaky!, Build Error! I written outside this file
print(jane2.credits)

// The teacher made a mistake; the class has 4 credits
math2.credits = 4.0
jane2.recordGrade(grade: math2)
print(jane2.credits)

// challenge
class User {
    let name: String
    var lists:[String:List]
    init(name: String){
        self.name = name
        lists = [:]
    }
    func add(list: List) {
        lists[list.name] = list
    }
    func list(name: String) -> List? {
        return lists[name]
    }
}

class List {
    let name: String
    var movieTitles: Set<String>
    init(name: String) {
        self.name = name
        movieTitles = []
    }
    func printList() {
        print(movieTitles)
    }
}

var list = List(name: "action")
var jane3 = User(name: "Jane")
var john3 = User(name: "Jhon")
jane3.add(list: list)
john3.add(list: list)
list.movieTitles.insert("Avengers")
print(jane3.list(name: "action")?.movieTitles)
jane3.list(name: "action")?.movieTitles.insert("Avengers")
john3.list(name: "action")?.movieTitles.insert("Batman")
jane3.list(name: "action")?.printList()
john3.list(name: "action")?.printList()
print(jane3.list(name: "action")?.movieTitles)
