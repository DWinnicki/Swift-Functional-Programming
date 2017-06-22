import Vapor
import Fluent

final class UserStore {
    
    static let sharedInstance = UserStore()
    fileprivate var list: [User] = Array<User>()
    private init() {
    }
    
    func addItem(item: User) -> Bool {
        if self.find(username: item.username) != nil {
            return false
        } else {
            self.list.append(item)
            return true
        }
    }
    
    func listItems() -> [User] {
        return self.list
    }
    
    func find(username: String) -> User? {
        return self.list.index { $0.username == username }.map { self.list[$0] }
    }
}
