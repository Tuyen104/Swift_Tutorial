import UIKit

/*
 let is unmutable
 var is mutable
 */

/*
 optional can be nil (?)
 unoptional can not be nil (!)
 
 unwrap option:
 - if let
 - !
 */

struct A {
    var name: String
}

var aObject = A(name: "Toan")
var a1Object = aObject

aObject.name = "Tuyen"

print(aObject.name)
print(a1Object.name)

class B {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var bObject = B(name: "Khanh")
var b1Object = bObject

bObject.name = "Duc"

print(bObject.name)
print(b1Object.name)


/*
 strong increase retain count +1
 weak ko tăng retain count lên 1
 retain count
 Retain cycles: strong <--> strong (=> memory leak)
 */

class Employee {
    var name: String
    var position: String
    weak var factory: Factory?
    
    init(name: String, position: String) {
        self.name = name
        self.position = position
    }
    
    deinit {
        print("RELEASE")
    }
}

// Retain Count
//var aEmployee: Employee? = Employee(name: "A", position: "Dev") // 1
//var bEmployee: Employee? = aEmployee // 2
//
//aEmployee = nil // 1
//bEmployee = nil // 0

// Retain cycles

class Factory {
    var employee: Employee?
}

var employee: Employee? = Employee(name: "Toan", position: "Dev")

var aFactory: Factory? = Factory()
aFactory?.employee = employee
employee?.factory = aFactory

aFactory = nil
employee = nil
