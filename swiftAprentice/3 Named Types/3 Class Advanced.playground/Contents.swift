// inheritance
struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}
class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    // deinitialization
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
    }
}
class Student: Person {
    var grades: [Grade]
    override required init(firstName: String, lastName: String) {
        grades = []
        super.init(firstName: firstName, lastName: lastName)
    }
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName,lastName: transfer.lastName)
        grades = []
    }
    func recordGrade(grade: Grade) {
        grades.append(grade)
    }
}
class StudentAthlete: Student {
    var failedClasses: [Grade]
    var sports: [String]
    init(firstName: String, lastName: String, sports: [String]) {
        failedClasses = []
        self.sports = sports
        let passGrade = Grade(letter: "F", points: 0.0, credits: 0.0)
//        objetct is still in initialization first phase
//        recordGrade(passGrade)
        super.init(firstName: firstName, lastName: lastName)
        recordGrade(passGrade)
    }
    init(transfer: Student, sports: [String]) {
        self.sports = sports
        self.failedClasses = []
        self.init(transfer: transfer)
    }
    required init(firstName: String, lastName: String) {
        failedClasses = []
        sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    override func recordGrade(grade: Grade) {
        super.recordGrade(grade)
        if grade.letter == "F" {
            self.failedClasses.append(grade)
        }
    }
    final func athleteIsEligible() -> Bool {
        return failedClasses.count < 3
    }
}
final class StarStudentAthlete: StudentAthlete {
//    override func athleteIsEligible() -> Bool { return true }
}
//class SuperStarStudentAthlete: StarStudentAthlete {}
let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

// polymorphism
func phonebookName(person: Person) -> String {
    return "\(person.lastName) \(person.firstName)"
}
let person = Person(firstName: "Johnny", lastName: "Appleseed")
let star = StarStudentAthlete(firstName: "Jane", lastName: "Appleseed",sports: ["Chess"])
phonebookName(person)
phonebookName(star)

class Team {
    var players: [StudentAthlete]
    init() {
        players = []
    }
    func teamEligable() -> Bool {
        for player in players {
            if !player.athleteIsEligible() {
                return false
            }
        }
        return true
    }
}
var team = Team()
//team.players.append(person)
team.players.append(star)

// shared base classes
import UIKit
/// a button that can be pressed, from a library you don't own
class Button {
    func press() {}
}
/// a button that is composed entirely of an image.
class ImageButton: Button {
    var image: UIImage?
}
/// a button that renders as text.
class TextButton: Button {
    var text: String?
}
func pressButton(button: Button) {
    button.press()
}
let imageButton = ImageButton()
let textButton = TextButton()
pressButton(imageButton)
pressButton(textButton)

// class lyfecycle
// ARC - Automatic Reference Counting - Reference Counting - Retain count
// Person object has a reference count of 1 (john2 variable)
var john2 = Person(firstName: "Johnny", lastName: "Appleseed")
// reference count 2 (john2, anotherJohn)
var anotherJohn: Person? = john2
// reference count 6 (john2, anotherJohn plus 4 references)
// the same reference is inside both john2 and anotherJohn
var lotsaJohns = [john2, john2, anotherJohn, john2]
// reference count 5 (john plus 4 references in lotsaJohns)
anotherJohn = nil
// reference count 1 (john)
lotsaJohns = []
// reference count 0
john2 = Person(firstName: "Johnny", lastName: "Appleseed")

// retain cycle
class StudentRC: Person {
    weak var partner: StudentRC?
    deinit {
        print("\(firstName) being deallocated!")
    }
}
var johnRC: StudentRC? = StudentRC(firstName: "Johnny", lastName: "Appleseed")
var janeRC: StudentRC? = StudentRC(firstName: "Jane", lastName: "Appleseed")
johnRC?.partner = janeRC
janeRC?.partner = johnRC
johnRC = nil
janeRC = nil
// johnRC and janeRC didn't deallocate unless declared weak (strong by default), memory leak


