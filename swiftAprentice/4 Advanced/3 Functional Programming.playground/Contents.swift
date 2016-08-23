// higher-order functions: map
let animals = ["cat", "dog", "sheep", "dolphin", "tiger"]
func capitalize(s: String) -> String {
    return s.uppercaseString
}
var uppercaseAnimals: [String] = []
for animal in animals {
    let uppercaseAnumal = capitalize(animal)
    uppercaseAnimals.append(uppercaseAnumal)
}
uppercaseAnimals
import Foundation
func characterForCharacterName(c: String) -> Character {
    let curlyBracedCharacterName = "\\N{\(c)}"
    let charStr = curlyBracedCharacterName.stringByApplyingTransform(NSStringTransformToUnicodeName, reverse: true)
    return charStr!.characters.first!
}
var animalsEmojis: [Character] = []
for uppercaseAnimal in uppercaseAnimals {
    let emoji = characterForCharacterName(uppercaseAnimal)
    animalsEmojis.append(emoji)
}
animalsEmojis
// motivation
// let inputs: [InputType] = [/* some list of InputType*/]
// let outputs: [OutputType] = []
// for inputItem in inputs {
//     let outputItem = transform(inputItem)
//     outputs.append(outputItem)
// }
// outputs // [/* some list of OutputType values */]

func map<InputType, OutputType>(inputs: [InputType], transform: (InputType) -> (OutputType)) -> [OutputType] {
    var outputs: [OutputType] = []
    for inputItem in inputs {
        let outputItem = transform(inputItem)
        outputs.append(outputItem)
    }
    return outputs
}
let uppercaseAnimals2 = map(animals, transform: capitalize)
let animalEmojis2 = map(uppercaseAnimals2, transform: characterForCharacterName)
let uppercaseAnimals3 = animals.map(capitalize)
let animalEmojis3 = uppercaseAnimals3.map(characterForCharacterName)

// functional programming style
func distanceTraveled(t: Float) -> Float {
    return 60 * t
}
func distanceTraveled2(t: Float) -> Float {
    let booster = 1 + Float(arc4random_uniform(2))
    return booster * 60 * t
}
var externalVariable: Float = 0
func distanceTraveled3(t: Float) -> Float {
    let booster = externalVariable
    return booster * 60 * t
}
distanceTraveled3(5)
externalVariable = 4
distanceTraveled3(5)
let uppercaseAnimals4 = animals.map { $0.uppercaseString }
let animalEmojis4 = uppercaseAnimals4.map(characterForCharacterName)

// filter
let threeCharacterAnimals = animals.filter() { $0.characters.count == 3 }
threeCharacterAnimals

// reduce
func sum(items: [Int]) -> Int {
    return items.reduce(0, combine: +)
}
let total = sum([1, 2, 3, 4])
total
func concatenate(items: [String]) -> String {
    return items.reduce("", combine: +)
}
let phrase = concatenate(["Hello", " ", "World"])
phrase

// challenge create map and filter using reduce











