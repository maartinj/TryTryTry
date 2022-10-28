/*:
 [< Previous](@previous)           [Home](Introduction)

 # Bubbling Try
Defer the catching of an error to the calling function

*/
import UIKit

let person2JSON = """
{
    "name": "James",
    "age": 45,
}
"""

class Person: ObservableObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case name, age
    }
    var name: String
    @Published  var age: Int
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        do {
//            name = try container.decode(String.self, forKey: .name)
//        } catch {
//            fatalError("Caught error at the initializer")
//        }
//        do {
//            age = try container.decode(Int.self, forKey: .age)
//        } catch {
//            fatalError("Caught error at the initializer")
//        }
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
    }
}

let decoder = JSONDecoder()
let person2JSONData = person2JSON.data(using: .utf8)!

var person: Person
do {
    person = try decoder.decode(Person.self, from: person2JSONData)
    print(person.name)
} catch {
    fatalError("Caught error at the end")
}
//:  [< Previous](@previous)           [Home](Introduction)
