// explicit declaration
let numbers: Array<Int>

// infered declaration
let inferredNumbers = Array<Int>()
let alsoInferredNumbers = [Int]()

// array literals
let evenNumbers = [2,4,6,8]
let allZeros = [Int](repeating: 0, count: 5)
let vowels = ["A", "E", "I", "O", "U"]

// accesing elements
var players = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty)
if players.count < 2 {
    print("We need at least two players!")
}else {
    print("Let's start!")
}

var currentPlayer = players.first
print(currentPlayer)
print(players.last)
currentPlayer = players.min()
print(currentPlayer)

print([2, 3, 1].first)
print([2, 3, 1].min())

if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}

// subscripting
var firstPlayer = players[0]
print("First player is \(firstPlayer)")
//var player = players[4]

// ranges
let upcomingPlayers = players[1...2]
print(upcomingPlayers)

// contains
func isPlayerEliminated(playerName: String) -> Bool {
    if players.contains(playerName) {
        return false
    } else {
        return true
    }
}

print(isPlayerEliminated(playerName: "Bob"))
players[1...3].contains("Bob")


// append
players.append("Eli")
players += ["Gina"]
//players += "Jhonny"
print(players)

// insert
players.insert("Frank", at: 5)

// removing
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed for cheating")
removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed for cheating")
if let nextCheaterIndex = players.index(of: "Dan") {
    removedPlayer = players.remove(at: nextCheaterIndex)
    print("\(removedPlayer) was removed for cheating")
}

// update
players[3] = "Franklin"
players[0...1] = ["Donna", "Craing", "Brian", "Anna"]
print(players)

// move
let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)

players = players.sorted()
print(players)
// or
//players.sortInPlace()

// iterate
let scores = [2, 2, 8, 6, 1, 2]
for playerName in players {
    print(playerName)
}

// iterate enumerate
for (index, playerName) in players.enumerated() {
    print("\(index + 1). \(playerName)")
}

// inside function
func sumOfAllItems(_ intArray: [Int]) -> Int {
    var sum = 0
    for number in intArray {
        sum += number
    }
    return sum
}
print(sumOfAllItems(scores))

// reduce
let sum = scores.reduce(0, +)
print(sum)

// filter
print(scores.filter({ $0 > 5}))
print(scores.filter(){ $0 > 5})
print(scores.filter({(score: Int) -> Bool in return score > 5}))
print(scores.filter({ score in score > 5}))

// map
var newScores = scores.map({$0 * 2})
newScores = scores.map(){$0 * 2}
newScores = scores.map({score in score * 2})
print(newScores)

// challenge
var array5 = [1, 2, 3]
array5[0] = array5[1]
//array5[0..1] = [4 ,5]
//array5[0] = "Six"
//array5 += 6
for item in array5 { print(item) }

func removeOnce(itemToRemove: Int, fromArray: [Int]) -> [Int] {
    var returnArray = fromArray
    if let indexToRemove = fromArray.index(of: itemToRemove) {
       returnArray.remove(at: indexToRemove)
    }
    return returnArray
}

func remove(itemToRemove: Int, fromArray:[Int]) -> [Int] {
    var returnArray = fromArray
    while let indexToRemove = fromArray.index(of: itemToRemove) {
        returnArray.remove(at: indexToRemove)
    }
    return returnArray
}

func reverse(_ array: [Int]) -> [Int] {
    return array.reversed()
}
print(reverse([4,2,6,8]))

import Foundation
func randomFromZeroTo(_ number: Int) -> Int {
    return Int(arc4random_uniform(UInt32(number)))
}

func randomArray(_ array: [Int]) -> [Int] {
    var returnArray = array
    for _ in 0...array.count*10 {
        let randomIndexFrom = randomFromZeroTo(array.count)
        let randomIndexTo = randomFromZeroTo(array.count)
        let removedItem = returnArray.remove(at: randomIndexFrom)
        returnArray.insert(removedItem, at: randomIndexTo)
    }
    return returnArray
}

let wtf = randomArray([5,3,9,14,1])
print(wtf)
