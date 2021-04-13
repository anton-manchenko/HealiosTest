//
//  HPostsAction.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Combine
import Foundation
import ReSwift
import ReSwiftThunk

enum HPostsAction: Action {
    case finishInitialLoad
    case requestStart
    case requestCompleted
    case updatePosts(_ posts: [Post]?)
    case updateError(_ error: AppError?)
    
    static func subscribe() -> AppThunkAction {
        AppThunkAction { dispatch, getState in
            let finishInitialLoad = {
                if getState()?.hPostsState.loadingState == .initial {
                    dispatch(HPostsAction.finishInitialLoad)
                }
            }
            finishInitialLoad()
        }
    }
    
    static func unsubscribe() -> AppThunkAction {
        AppThunkAction { dispatch, getState in
            getState()?.hPostsState.listenerCancellable?.cancel()
        }
    }
    
    static func requestPosts(_ service: ServiceProtocol) -> AppThunkAction {
        AppThunkAction { dispatch, getState in
            dispatch(HPostsAction.requestStart)
            dispatch(HPostsAction.updateError(nil))
            dispatch(HPostsAction.updatePosts(nil))
            service.getPosts{ (data) in
                dispatch(HPostsAction.updatePosts(data))
                dispatch(HPostsAction.requestCompleted)
            } onError: { (error) in
                dispatch(HPostsAction.updateError(error))
                dispatch(HPostsAction.requestCompleted)
            }
        }
    }
}


