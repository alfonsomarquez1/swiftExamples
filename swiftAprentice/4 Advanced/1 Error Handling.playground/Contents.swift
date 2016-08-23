// protocol ErrorType
enum RollingError: ErrorType {
    case Doubles
    case OutOfFounding
}
// Start-Up-Oopoly - Monopoly typed game
var hasFounding = true
func roll(firstDice: Int, secondDice: Int) throws {
    let error: RollingError
    if firstDice == secondDice && hasFounding {
        error = .Doubles
        hasFounding = false
        throw error
    } else if firstDice == secondDice && !hasFounding {
        hasFounding = true
        print("Huzzah! You raise another round of founding!")
    } else if !hasFounding {
        error = .OutOfFounding
        throw error
    } else {
        print("You moved \(firstDice + secondDice) spaces")
    }
}
func move(firstDice: Int, secondDice: Int) -> String {
    do {
        try roll(firstDice, secondDice: secondDice)
        return "Successful roll."
    } catch RollingError.Doubles {
        return "You rolled doubles and have lost your funding"
    } catch RollingError.OutOfFounding {
        return "You neet to do another round of funding"
    } catch {
        return "Unknown error"
    }
}
move(1, secondDice: 2)
move(4, secondDice: 4)
move(1, secondDice: 6)
move(1, secondDice: 1)

// advanced error handling
// PugBot
enum Direction {
    case Left, Right, Forward
}
class PugBot {
    let name: String
    let correctPath: [Direction]
    var currentStepInPath = 0
    init? (name: String, correctPath: [Direction]) {
        self.correctPath = correctPath
        self.name = name
        guard (correctPath.count > 0) else { return nil }
        switch name {
        case "Delia", "Olive", "Frank", "Otis", "Doug":
            break
        default:
            return nil
        }
    }
}
let rightDirections: [Direction] = [.Forward, .Left, .Forward, .Right]
let wrongDirections: [Direction] = [.Left, .Left, .Left, .Forward]
let invalidPug = PugBot(name: "Lassie", correctPath: rightDirections)
let myPugBot = PugBot(name: "Delia", correctPath: rightDirections)
let wrongPugBot = PugBot(name: "Delia", correctPath: wrongDirections)
enum PugBotError: ErrorType {
    case DidNotTurnLeft(directionMoved: Direction)
    case DidNotTurnRight(directionMoved: Direction)
    case DidNotGoForward(directionMoved: Direction)
    case EndOfPath
}
class PugBot2 {
    let name: String
    let correctPath: [Direction]
    var currentStepInPath = 0
    init? (name: String, correctPath: [Direction]) {
        self.correctPath = correctPath
        self.name = name
        guard (correctPath.count > 0) else { return nil }
        switch name {
        case "Delia", "Olive", "Frank", "Otis", "Doug":
            break
        default:
            return nil
        }
    }
    func turnLeft() throws {
        guard (currentStepInPath < correctPath.count) else {
            throw PugBotError.EndOfPath
        }
        let direction = correctPath[currentStepInPath]
        if direction != .Left {
            throw PugBotError.DidNotTurnLeft(directionMoved: direction)
        }
        currentStepInPath += 1
    }
    func turnRight() throws {
        guard (currentStepInPath < correctPath.count) else {
            throw PugBotError.EndOfPath
        }
        let direction = correctPath[currentStepInPath]
        if direction != .Right {
            throw PugBotError.DidNotTurnRight(directionMoved: direction)
        }
        currentStepInPath += 1
    }
    func moveForward() throws {
        guard (currentStepInPath < correctPath.count) else {
            throw PugBotError.EndOfPath
        }
        let direction = correctPath[currentStepInPath]
        if direction != .Forward {
            throw PugBotError.DidNotGoForward(directionMoved: direction)
        }
        currentStepInPath += 1
    }
    func goHome() throws {
        try moveForward()
        try turnLeft()
        try moveForward()
        try turnRight()
    }
}
func movePugBotSafely(move: () throws -> ()) -> String {
    do {
        try move()
        return "Completed move successfully."
    } catch PugBotError.DidNotTurnLeft(let directionMoved) {
        return "The PugBot was supposed to turn left, but turned \(directionMoved) instead."
    } catch PugBotError.DidNotTurnRight(let directionMoved) {
        return "The PugBot was supposed to turn right, but turned \(directionMoved) instead."
    } catch PugBotError.DidNotGoForward(let directionMoved) {
        return "The PugBot was supposed to move forward, but turned \(directionMoved) instead."
    } catch PugBotError.EndOfPath() {
        return "The PugBot tried to move past the end of the path."
    } catch {
        return "An unknown error occurred."
    }
}
if let myPugBot2 = PugBot2(name: "Delia", correctPath: rightDirections) {
    movePugBotSafely {
        try myPugBot2.goHome()
        try myPugBot2.moveForward()
    }
}





