//
//  AnyInitializer.swift
//  RouterServiceDiscovery
//
//  Created by Fernando Luiz Goulart on 30/05/22.
//

import Foundation

public final class AnyInitializer {

    public let build: (Store) -> Any

    public init<T: Dependency, U: Dependency, V>(_ function: @escaping (T, U) -> V) {
        build = { store in
            let t: T = store.get(T.self)
            let u: U = store.get(U.self)
            return function(t, u)
        }
    }

}
