import UIKit

// Closure Syntax

// define closure
let closureA = { (text: String) -> Int in
    return text.count
}

// init closure
closureA("Toan")

// Closure Type

//
let calSum: (Int, Int) -> Int = {
    return $0+$1
}

//
calSum(2,3)

// Closure rut gon

let closureC = { (a: Int, b: Int) -> Int in
    return a*b
}(2,3)

// Trailing Closure

func setName(_ name: String, validName: (String) -> Void) {
    // To Do
    validName(name)
}

setName("Toan") { (name) in
    print("Name is \(name.count >= 4 ? "True" : "False")")
}

// Weak & Unowned trong closure

// ***Khi một tham chiếu đi vào closure thì luôn luôn là tham chiếu strong
// Khi mà một closure chứa 1 tham chiếu mạnh và tham chiếu đến một tham chiếu mạnh khác -> retain cycles
// Solution:
// - weak: biến một tham chiếu strong -> weak (optional)
// - unowned: biến một tham chiếu strong -> weak (unoptional)

class Pet {
    let name: String
    var handleMakeSound: (() -> Void)?
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        self.doSomething { [weak self] in
            if let strongSelf = self  {
                print("Pet is \(strongSelf.name)")
            }
        }
    }
    
    func doSomething(_ action: (() -> Void)?) {
        self.handleMakeSound = action
        self.handleMakeSound!()
    }
    
    deinit {
        print("RELEASE")
    }
}

var petA: Pet? = Pet(name: "REX")
petA?.makeSound()

petA = nil
