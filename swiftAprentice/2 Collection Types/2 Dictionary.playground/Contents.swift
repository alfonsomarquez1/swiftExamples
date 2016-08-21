// explicit declaration
let pairs: Dictionary<String, Int>

// infered
let inferedPairs = Dictionary<String, Int>()
let alsoInferedPairs = [String: Int]()

// literals
let namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)

// empty dictionary
var emptyDictionary: [Int:Int]
emptyDictionary = [:]

// subscripting
print(namesAndScores["Anna"])
print(namesAndScores["Greg"])

// properties and methods
namesAndScores.isEmpty
namesAndScores.count

// keys and values
Array(namesAndScores.keys)
Array(namesAndScores.values)

// update
var bobData = ["name": "Bob", "profession": "Card Player", "country": "USA"]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"

bobData.updateValue("Bobby", forKey: "name")
bobData["profession"] = "Mailman"

// remove
bobData.removeValueForKey("state")
bobData["city"] = nil

// iterating
for (key, value) in namesAndScores {
    print("\(key) - \(value)")
}

for key in namesAndScores.keys {
    print("\(key), ", terminator: "")
}
print("")

for value in namesAndScores.values {
    print("\(value), ", terminator: "")
}

//reduce
var names =  namesAndScores.reduce("", combine: {$0 + "\($1.0), "})
names = namesAndScores.reduce("") { $0 + "\($1.0), "}
names = namesAndScores.reduce("", combine: { (accumulator, dictionary) -> String in
    accumulator + "\(dictionary.0), "
})
names = namesAndScores.reduce("") {(accumulator, dictionary: (key: String,value: Int)) -> String in
    accumulator + "\(dictionary.key), "
}
print(names)

// filter
var finalists = namesAndScores.filter({$0.1 > 5})
finalists = namesAndScores.filter({ (dictionary: (key: String, value: Int)) -> Bool in
    dictionary.value > 5
})
print(finalists)

//map
let namesAndDoublePoints = namesAndScores.map({ (dictionary: (key: String, value: Int)) -> (String, Int) in
    (dictionary.key, dictionary.value * 2)
})
print(namesAndDoublePoints)
let doublePoints = namesAndScores.map({$0.1*2})
print(doublePoints)

// hashing
print("some string".hashValue)
print(1.hashValue)
print(false.hashValue)

func swapValueForKey(key1: String, withValueForKey key2: String, inDictionary: [String : String]) -> [String: String] {
    var swappedDictionary = inDictionary
    let newValue = inDictionary[key1]
    let swappedValue = inDictionary[key2]
    swappedDictionary[key2] = newValue
    swappedDictionary[key1] = swappedValue
    return swappedDictionary
}
print(swapValueForKey("Saty", withValueForKey: "Dashi", inDictionary: ["Saty": "Boy","Dashi": "Barashi"]))

func combine(dict1: [String: String], with dict2:[String: String]) -> [String: String] {
    var returnDictionary = dict1
    dict2.map({ dictionary -> Void in returnDictionary[dictionary.0] = dictionary.1})
    return returnDictionary
}
print(combine(["Saty":"Boy"], with: ["Saty":"Sat","Dashi":"Barashi"]))




