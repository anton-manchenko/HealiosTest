//
//  AppMain.swift
//  IpData
//
//  Created by Anton on 03.02.2021.
//

import Foundation
import ReSwift
import ReSwiftThunk

final class AppMain {
    let store: AppStore

    init(store: Store<AppState> = makeStore(), service: ServiceProtocol = ServiceHPApi()) {
        self.store = AppStore(store: store, service: service)
    }
}

private func makeStore() -> Store<AppState> {
    .init(
        reducer: AppReducer.reducer,
        state: .init(),
        middleware: [
            createLoggingMiddleware(),
            createThunkMiddleware(),
        ]
    )
}
