//
//  DependecyInjector.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation
import Swinject
@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}

class Resolver {
    static let shared = Resolver()
    private var container = allViewContainer()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}
private func allViewContainer() -> Container {
    let container = Container()
    return container
}
