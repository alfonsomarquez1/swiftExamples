// closed range
let closedRange = 0...5

// half open range
let halfOpenRange = 0..<5

// switch with range
let hourOfDay = 12
let timeOfDay: String

switch(hourOfDay) {
case 0...5:
    timeOfDay = "Early morning"
case 6...11:
    timeOfDay = "Morning"
case 12...16:
    timeOfDay = "Aftermoon"
case 17...19:
    timeOfDay = "Evening"
case 20..<24:
    timeOfDay = "Late evening"
default:
    timeOfDay = "Invalid hour!".uppercaseString
}

// for loop
let count = 10
var sum = 0
for i in 1...count {
    sum += i
}

// for with underscore
let count2 = 10
var sum2 = 1
var lastSum = 0
for  _ in 0..<count2 {
    let temp = sum2
    sum2 = sum2 + lastSum
    lastSum = temp
}

// while loop
var sum3 = 1
while sum3 < 1000 {
    sum3 = sum3 + (sum3 + 1)
}

// repeat while loop
 var sum4 = 1
repeat {
    sum4 = sum4 + (sum4 + 1)
} while sum4 < 1

// break a loop
var sum5 = 1
while true {
    sum5 = sum5 + (sum5 + 1)
    if sum5 >= 1000 {
        break
    }
}

// continue loop
var sum6 = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    for column in 0..<8 {
        sum6 += row * column
    }
}

// label
var sum7 = 0
rowLoop:
    for row in 0..<8 {
    columnLopp: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        sum7 += row * column
    }
}
