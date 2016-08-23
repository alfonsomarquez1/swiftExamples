// introduction
extension String {
    func shout()  {
        print(self.uppercaseString)
    }
}

protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    func winningPercentage() -> Double
}
extension TeamRecord {
    var gamesPlayed: Int {
        return wins + losses
    }
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}
struct  BaseBallRecord: TeamRecord {
    var wins: Int
    var losses: Int
    let seasonLength = 162
}
let sanFranciscoSwifts = BaseBallRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed
struct BasketballRecord: TeamRecord {
    let wins: Int
    var losses: Int
    let seasonLength = 82
}
struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    // Hockey record ties
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}
let baseballRecord: TeamRecord = BaseBallRecord(wins: 10, losses: 6)
let hockeyRecord: TeamRecord = HockeyRecord(wins: 8, losses: 7, ties: 1)
baseballRecord.winningPercentage()
hockeyRecord.winningPercentage()
extension CustomStringConvertible {
    var description: String {
        return "Remember to implement CustomStringConvertible!"
    }
}
struct MyStruct: CustomStringConvertible {}
print(MyStruct())
struct ChessRecord: TeamRecord {
    var wins: Int
    var losses: Int
    let gamesPlayed: Int = 162
}
let team1: TeamRecord = BaseBallRecord(wins: 10, losses: 5)
let team2: BaseBallRecord = BaseBallRecord(wins: 10, losses: 5)
let team3: ChessRecord = ChessRecord(wins: 10, losses: 5)
team1.gamesPlayed
team2.gamesPlayed
team3.gamesPlayed

// protocol extension dispatching
protocol MyProtocol {
    func foo()
}
extension MyProtocol {
    func foo() { print("Hello!")}
}
struct MyType: MyProtocol {
    func foo() {print("Good Day!")}
}
let foo: MyType = MyType()
foo.foo()
let fooP: MyProtocol = MyType()
fooP.foo()

protocol MyProtocol2 {}
extension MyProtocol2 {
    func bar() {
        print("Hello!")
    }
}
struct MyType2: MyProtocol2 {
    func bar() {
        print("Good Day!")
    }
}
let bar: MyProtocol2 = MyType2()
bar.bar()

protocol MyProtocol3 {
    func bar()
}
extension MyProtocol3 {
    func bar() {
        print("Hello!")
    }
}
struct MyType3: MyProtocol3 {
    func bar() {
        print("Good Day!")
    }
}
let bar2: MyProtocol3 = MyType3()
bar2.bar()

// type constraints
protocol PlayoffEligible {
    var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PlayoffEligible {
    func isPlayoffEligible() -> Bool {
        return self.wins > minimumWinsForPlayoffs
    }
}

protocol Tieable {
    var ties: Int { get }
}
extension TeamRecord where Self: Tieable {
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}
struct HockeyRecord2: TeamRecord, Tieable, CustomStringConvertible {
    var wins: Int
    var losses: Int
    var ties: Int
}
let hockeyRecord2: TeamRecord = HockeyRecord(wins: 8, losses: 7, ties: 1)
hockeyRecord2.winningPercentage()

extension TeamRecord where Self: CustomStringConvertible {
    var description: String {
        return "\(wins) - \(losses)"
    }
}
print(hockeyRecord2)

protocol TieableRecord {
    var ties: Int { get }
}
protocol DivisionalRecord {
    var divisionalWins: Int { get }
    var divisionalLosses: Int { get }
}
protocol PointableRecord {
    func totalPoints() -> Int
}
extension PointableRecord where Self: TieableRecord, Self: TeamRecord {
    func totalPoints() -> Int {
        return (2 * wins) + (1 * ties)
    }
}
struct HockeyRecord3: TeamRecord, TieableRecord, DivisionalRecord, CustomStringConvertible, Equatable {
    var wins: Int
    var losses: Int
    var ties: Int
    var divisionalWins: Int
    var divisionalLosses: Int
    var description: String {
        return "\(wins) - \(losses) - \(ties)"
    }
}
func ==(lhs: HockeyRecord3, rhs: HockeyRecord3) -> Bool {
    return lhs.wins == rhs.wins && lhs.ties == rhs.ties && lhs.losses == rhs.losses
}

// challenge
protocol Item {
    var name: String { get }
    var clearance: Bool { get }
    var msrp: Float { get }
    func totalPrice() -> Float
}
protocol Discountable {
    var discount: Float { get }
}
protocol Taxable {
    var saleTax: Float { get }
}
extension Taxable {
    var saleTax: Float {
        return 7.5
    }
}
extension Item {
    var clearance: Bool {
        return false
    }
}
extension Item where Self: Taxable {
    func totalPrice() -> Float {
        let tax = msrp * saleTax
        return msrp + tax
    }
}
extension Item where Self: Discountable {
    func totalPrice() -> Float {
        return 0.0
    }
}
