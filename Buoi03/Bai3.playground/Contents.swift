import UIKit

enum Pet: String {
    case Dog
    case Cat
}

print(Pet.Dog.rawValue)

let dog = Pet(rawValue: "Dog")
print(dog?.rawValue ?? "")

let a = 0 // a is 0 or 1

enum DirectType: Int {
    case Up = 1
    case Down = 0
}

switch DirectType.init(rawValue: a)! {
case .Up:
    print("Up")
case .Down:
    print("Down")
}

//if a == 0 {
//    print("Up")
//}
//else {
//    print("Down")
//}

enum BarCode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

let code = BarCode.upc(1, 1, 1, 1)
let qrCode = BarCode.qrCode("ascvdferg")

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    
    func displayDatImporter() {
        print(importer.filename)
    }
}

DataManager().displayDatImporter()


struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var rectA = Rect(origin: Point(x: 0, y: 0), size: Size(width: 50, height: 50))
print(rectA.center)

rectA.center = Point(x: 10, y: 10)
print(rectA.origin)

class Person {
    var name: String = "Khanh" {
        willSet {
            print("Person is \(self.name)")
            print("Person will be \(newValue)")
        }
        didSet {
            print("Person is \(oldValue)")
            print("Person is \(self.name)")
        }
    }
    
    static var age: Int = 10
    
    func displayName() {
        print(self.name) // self is instance of Person (Person())
    }
    
    class func showName() {
        print(self.age) // self is Person (Person.Type)
    }
    
    func validName(_ name: String) throws -> String {
        guard name.count > 3 else {
            throw NSError(domain: "invalidName", code: 234, userInfo: nil)
        }
        
        return name
    }
    
}

var personA = Person()
personA.name = "Toan"

do {
    try personA.validName("abcd")
}
catch {
    print(error.localizedDescription)
}
