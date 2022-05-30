//
//  Store.swift
//  RouterServiceDiscovery
//
//  Created by Fernando Luiz Goulart on 30/05/22.
//

public final class Store {

    // Duvida: e se eu precisar de variantes de uma mesma dependencia ? Vou precisar usar herança ?
    var dependencies = [String: Any]()

    public init() {}

    func get<T>(_ dependencyType: T.Type) -> T {
        let name = String(describing: dependencyType)
        return dependencies[name] as! T
    }

    func register(_ dependency: Dependency) {
        let name = String(describing: type(of: dependency))
        dependencies[name] = dependency
    }
}
