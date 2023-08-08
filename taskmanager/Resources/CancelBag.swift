//
//  CancelBag.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//


import Combine

final class CancelBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>()
    func cancel() {
        subscriptions.removeAll()
    }
    func collect(@Builder _ cancellables: () -> [AnyCancellable]) {
        subscriptions.formUnion(cancellables())
    }
    @resultBuilder
    struct Builder {
        static func buildBlock(_ cancellables: AnyCancellable...) -> [AnyCancellable] {
            return cancellables
        }
    }
}
extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
