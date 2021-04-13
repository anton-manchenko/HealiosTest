//
//  AppReducer.swift
//  IpData
//
//  Created by Anton on 16.03.2021.
//

import Foundation
import ReSwift

enum AppReducer {
    static var reducer: Reducer<AppState> {
        return { action, state in
            var state = state ?? AppState()
            state.hPostsState = HPostsReducer.reducer(action, state.hPostsState)
            state.hPostDetailState = HPostsDetailReducer.reducer(action, state.hPostDetailState)
            return state
        }
    }
}
