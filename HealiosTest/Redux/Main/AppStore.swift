//
//  AppStore.swift
//  IpData
//
//  Created by Anton on 03.02.2021.
//

import Combine
import Foundation
import ReSwift

final class AppStore: StoreSubscriber, DispatchingStoreType, ObservableObject {
    private let store: Store<AppState>
    var state: AppState { store.state }
    private(set) var objectWillChange: ObservableObjectPublisher = .init()
    private(set) var service: ServiceProtocol

    init(store: Store<AppState>, service: ServiceProtocol) {
        self.store = store
        self.service = service
        store.subscribe(self)
    }

    func newState(state: AppState) {
        objectWillChange.send()
    }

    func dispatch(_ action: Action) {
        if Thread.isMainThread {
            store.dispatch(action)
        } else {
            DispatchQueue.main.async { [store] in
                store.dispatch(action)
            }
        }
    }

    deinit {
        store.unsubscribe(self)
    }
}
