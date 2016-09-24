// Declaring an enumeration
enum Coffee {
    case Ventti
    case Grande
    case Alto
}
enum Month {
    case January, February, March, April, May, June, July, August, September, October, November, December
}
func schoolSemester(month: Month) -> String {
    switch month {
    case .August, .September, .October, .November, .December:
        return "Autumn"
    case .January, .February, .March, .April, .May:
        return "Spring"
    default:
        return "Not in the school year"
    }
}
var month: Month = .July
month = Month.April
month = .September
schoolSemester(month: month)

// raw values
enum Month2: Int {
    // January = 0, February = 1, March = 2,...
    case January, February, March, April, May, June, July, August, September, October, November, December
}
enum Month3: Int {
    case January = 1, February = 2, March = 3, April = 4, May = 5, June = 6, July = 7, August = 8, September = 9, October = 10, November = 11, December = 12
}
enum Month4: Int {
    // January = 1, February = 2, March = 3,...
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}
func  monthsUntilWinterBreak(month: Month4) -> Int {
    return Month4.December.rawValue - month.rawValue
}
monthsUntilWinterBreak(month: .April)
if let fifthMonth = Month4(rawValue: 5) {
    monthsUntilWinterBreak(month: fifthMonth)
}
enum Coin: Int {
    case Penny = 1, Nickel = 5, Dime = 10, Quarter = 25
}
let coin = Coin.Quarter
coin.rawValue
var coinPurse:[Coin] = [.Penny, .Nickel, .Dime, .Penny, .Quarter]

// associated values
var balance = 100
enum WithdrawalResult {
    case Success(Int)
    case Error(String)
}
func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .Success(balance)
    } else {
      return .Error("Not enough money!")
    }
}
let result = withdraw(amount: 99)
switch result {
case let .Success(newBalance):
    print("Your new balance is: \(newBalance)")
case let .Error(message):
    print(message)
}
enum HTTPMethod {
    case GET
    case POST(String)
}

// enumeration as state machine
enum TrafficLight {
    case Red, Yellow, Green
}
let trafficLight = TrafficLight.Red
enum HouseSwitch {
    case On, Off
}

// optionals are enums
var age: Int?
age = 17
age = nil
let email: Optional<String> = .none
let website: Optional<String> = .some("raywenderlich.com")
switch website {
case .none:
    print("No value")
case let .some(value):
    print("Got a value: \(value)")
}
let optionalNil: Optional<Int> = .none
optionalNil == nil
optionalNil == .none

// challenges
func countThatMoney(coins: [Coin]) -> Int {
    var money = 0
    for coin in coins {
        money += coin.rawValue
    }
    return money
}
print(countThatMoney(coins: coinPurse))

