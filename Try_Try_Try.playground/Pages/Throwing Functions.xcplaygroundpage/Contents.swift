/*:
  [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 # A Throwing Function
 functions or methods that might generate an error
 */
import Foundation

//func validateCredentials(username: String, password: String) throws {
//    // You might have some logic here that will check to see if
//    // the username and/or password fullfill your requirements
//}
//validateCredentials(username: "Stewart", password: "password")
/*:
 ## Error Enum
 Throwing functions can have an associated enum error
 */
enum CredentialsErrors: Error {
    case badUserName
    case badPassword
}

func validateCredentials(username: String, password: String) throws {
    if username.count < 4 {
        throw CredentialsErrors.badUserName
    }
    if (password.rangeOfCharacter(from: NSCharacterSet.decimalDigits) == nil) {
        throw CredentialsErrors.badPassword
    }
    print("Passed")
}
//try validateCredentials(username: "Stewart", password: "pass")
/*:
 ## Try
 Use in a do - try - catch block when you want to deal with specific types of errors
 */
//do {
//    try validateCredentials(username: "Stewart", password: "pass1")
//} catch {
//    switch error {
//    case CredentialsErrors.badUserName:
//        print("Username is too short")
//    case CredentialsErrors.badPassword:
//        print("Password does not contain a decimal number")
//    default:
//        break
//    }
//}
/*:
 ## Try?
 */
//if (try? validateCredentials(username: "Stew", password: "pass1")) == nil {
//    print("Failed")
//} else {
//    print("Credentials passed")
//}

func login(username: String, password: String) {
    guard (try? validateCredentials(username: username, password: password)) != nil else {
        print("Failed")
        return
    }
    print("Successful credentials")
    // Carry on with login
}

login(username: "Stewart", password: "pass1")
/*:

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/
