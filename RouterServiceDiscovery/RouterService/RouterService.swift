//
//  RouterService.swift
//  RouterServiceDiscovery
//
//  Created by Fernando Luiz Goulart on 30/05/22.
//

public final class RouterService: Dependency {

    var store: Store

    public init(store: Store = Store()) {
        self.store = store
        register(self)
    }

    public func register(_ dependency: Dependency) {
        store.register(dependency)
    }

    func navigate<T: Feature>(
        toFeature: T.Type,
        fromView viewController: GenericView
    ) {
        let deps = T.dependenciesInitializer.build(store) as! T.Dependencies
        let nextViewController = T.build(dependencies: deps)
        viewController.navigateTo(nextViewController)
    }
}
