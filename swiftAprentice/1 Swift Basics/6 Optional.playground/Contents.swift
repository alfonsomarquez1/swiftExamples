// Optional sceneario
var name: String = "Saty boy"
var age: Int = 30
var occupation: String? = "code ninja"

//Sentinel values
var errorCode: Int = 0

// intro optionals
var errorCodeO: Int?
errorCodeO = 100
errorCodeO = nil

// unwrapping optionals
let ageInteger: Int? = 30
print(ageInteger)
//print(ageInteger + 1)
//let nope = ageInteger + 1

// force unwrapping
var authorName: String? = "Saty boy"
var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")

// danger
authorName = nil
//unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")

// safe unwrapping
if authorName != nil {
    unwrappedAuthorName = authorName!
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}

// if let binding
if let unwrappedAuthorName: String = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}

// if let binding multiple values
let authorNameO: String? = "Saty"
let authorAgeO: Int? = 30

if let name = authorNameO, age = authorAgeO {
    print("The author is \(name) who is \(age) years old.")
} else {
    print("No author or no age")
}

// nil coalescing
var optionalInt: Int? = 10
var result: Int = optionalInt ?? 0
optionalInt = nil
result = optionalInt ?? 0




