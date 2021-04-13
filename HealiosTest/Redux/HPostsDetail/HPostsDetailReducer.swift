//
//  HPostsReducer.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Foundation
import ReSwift

enum HPostsDetailReducer {
    static var reducer: Reducer<HPostsDetailState> {
        return { action, state in
            var state = state ?? HPostsDetailState()
            guard let action = action as? HPostsDetailAction else {
                return state
            }
            switch action {
            
            case .finishInitialLoad:
                state.loadingState = .loaded
                return state
            case .requestStart:
                state.requesting = true
                return state
            case .requestCompleted:
                state.requesting = false
                return state
            case .updateUsers(let users):
                state.users = users
                return state
            case .updateComments(let comments):
                state.comments = comments
                return state
            case .updateError(let error):
                state.error = error
                return state
            }
        }
    }
}

