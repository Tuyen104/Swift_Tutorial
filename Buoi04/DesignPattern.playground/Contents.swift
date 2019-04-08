import UIKit

/// Singleton Pattern: Creational Pattern

class TrueLove {
    static let instance: TrueLove = TrueLove() //
    
    func show() {
        print(".......")
    }
    
    deinit {
        print("Relesae Memory For TrueLove")
    }
}

TrueLove.instance.show()

//var trueLove: TrueLove? = TrueLove()
//trueLove?.show()
//trueLove = nil

/// Delegation Pattern: Behavior Pattern

/// example:
/// A: tuyển nhân viên để làm kĩ thuật (A ko thể làm dc)
/// A: đăng tin tuyển nhân viên
/// B: gặp mặt A và đăng kí để làm nhân viên của A
/// B: sẽ thực hiện việc về kĩ thuật mà A mong muốn

protocol OwnerDelegate: class {
    func didSendSpamMesage()
}

class Owner {
    weak var delegate: OwnerDelegate?
    
    func sendSpamMesage() {
        self.delegate?.didSendSpamMesage()
    }
}

class Employee: OwnerDelegate {
    var myOwner: Owner
    
    init(owner: Owner) {
        self.myOwner = owner
        self.myOwner.delegate = self
    }
    
    func didSendSpamMesage() {
        print("SPAM MESSAGE...")
    }
}

let ownerA = Owner()
let emplyeeB = Employee(owner: ownerA)
ownerA.sendSpamMesage()

/// Observer Pattern: Behavior Pattern

/// example:
/// F: nền tangr social Instagram
/// B: con B hoa khôi người mẫu trên Instagram
/// [A]: muốn follow con B
/// [A]: phải install app instagram và đăng kí follow con B
/// B: cho phép mấy thèn A follow
/// B: có bất kì trạng status hay hình ảnh trên Instagram thì mấy thèn A phải thay đổi hay làm đó để cua được con B

///

protocol Instagram {
    func receiveNotify(_ state: String)
}

class Model {
    var followeList: [Follower] = [Follower]()
    var state: String {
        didSet {
            self.notify()
        }
    }
    
    init(state: String) {
        self.state = state
    }
    
    func registerFollower(_ follower: Follower) {
        self.followeList.append(follower)
    }
    
    func unregisterFollower(_ follower: Follower) {
        
    }
    
    func notify() {
        for follower in self.followeList {
            follower.receiveNotify(self.state)
        }
    }
}

class Follower: Instagram {
    func receiveNotify(_ state: String) {
        // Làm j đó khi có notify
        print("Comment tại sao em \(state)")
    }
}

let immahunni = Model(state: "Bình Thường")

let toan = Follower()
let khanh = Follower()
let duc = Follower()

immahunni.registerFollower(toan)
immahunni.registerFollower(khanh)
immahunni.registerFollower(duc)

immahunni.state = "Buồn"
