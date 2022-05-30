//
//  RouterServiceDiscoveryTests.swift
//  RouterServiceDiscoveryTests
//
//  Created by Fernando Luiz Goulart on 30/05/22.
//

import XCTest
@testable import RouterServiceDiscovery

class RouterServiceDiscoveryTests: XCTestCase {

    func test_store() {
        let mStore = Store()
        let dep1 = Dep1()
        mStore.register(dep1)
        let mDep1: Dep1 = mStore.get(Dep1.self)
        mDep1.fetch()
    }

    func test_feature() {
        let mStore = Store()
        let dep1 = Dep1()
        let dep2 = Dep2()
        mStore.register(dep1)
        mStore.register(dep2)
        let featDeps: FeatureOne.Dependencies = FeatureOne.dependenciesInitializer.build(mStore) as! FeatureOne.Dependencies
        let viewController: FeatureOneViewController = FeatureOne.build(dependencies: featDeps) as! FeatureOneViewController
        viewController.testIt()
    }

    func test_router() {
        let mStore = Store()
        let router = RouterService(store: mStore)
        let dep1 = Dep1()
        let dep2 = Dep2()
        router.register(dep1)
        router.register(dep2)
        let splashScreen: UIViewController = UIViewController()
        router.navigate(toFeature: FeatureOne.self, fromView: splashScreen)
    }

}

class Dep1: Dependency {

    init() {

    }

    func fetch() {
        print("Dep1 fetch ok")
    }
}

class Dep2: Dependency {

}

enum FeatureOne: Feature {
    static func build(dependencies: Dependencies) -> GenericView {
        return FeatureOneViewController(dependencies: dependencies)
    }

    static var dependenciesInitializer: AnyInitializer {
        return AnyInitializer(Dependencies.init)
    }

    struct Dependencies {
        let dep1: Dep1
        let dep2: Dep2
    }
}

class FeatureOneViewController: UIViewController {

    init(dependencies: FeatureOne.Dependencies) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func testIt() {
        print("FUNCIONOU")
    }
}
