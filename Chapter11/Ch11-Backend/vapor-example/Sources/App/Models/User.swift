import Vapor
import Fluent

final class User: Model {
    var id: Node?
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        username = try node.extract("username")
        password = try node.extract("password")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "username": username,
            "password": password
        ])
    }

    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}

extension User {
    public convenience init?(from string: String) throws {
        self.init(username: string, password: string)
    }
}
