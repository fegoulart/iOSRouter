//
//  Feature.swift
//  RouterServiceDiscovery
//
//  Created by Fernando Luiz Goulart on 30/05/22.

public protocol Feature {
    associatedtype Dependencies

    static var dependenciesInitializer: AnyInitializer { get }
    static func build(dependencies: Dependencies) -> GenericView
}
