/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 # Decodable

*/
import UIKit

let person1JSON = """
{
    "name": "James",
    "age": 45,
}
"""


struct Person: Decodable {
    var name: String
    var age: Int
}

let decoder = JSONDecoder()
let person1JSONData = person1JSON.data(using: .utf8)!

//let person = decoder.decode(Person.self, from: person1JSONData)
/*:
 ## Try!
 */
//let person = try! decoder.decode(Person.self, from: person1JSONData)
//print(person.name)
/*:
 ## do try catch
 */
//do {
//    let person = try decoder.decode(Person.self, from: person1JSONData)
//    print(person.name)
//} catch {
//    print(error.localizedDescription)
//}
/*:
 ## Try?
 */
let person = try? decoder.decode(Person.self, from: person1JSONData)
// One way of dealing with this
//if let person = person {
//    print(person.name)
//} else {
//    print("Person does not exist")
//}

// Alternative
print(person?.name ?? "Person does not exist")
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
