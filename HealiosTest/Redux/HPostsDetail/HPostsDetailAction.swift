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

enum HPostsDetailAction: Action {
    case finishInitialLoad
    case requestStart
    case requestCompleted
    case updateUsers(_ users: [User]?)
    case updateComments(_ comments: [Comment]?)
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
    
    static func requestUsers(_ service: ServiceProtocol) -> AppThunkAction {
        AppThunkAction { dispatch, getState in
            dispatch(HPostsDetailAction.requestStart)
            dispatch(HPostsDetailAction.updateError(nil))
            dispatch(HPostsDetailAction.updateUsers(nil))
            service.getUsers{ (data) in
                dispatch(HPostsDetailAction.updateUsers(data))
                dispatch(HPostsDetailAction.requestCompleted)
            } onError: { (error) in
                dispatch(HPostsDetailAction.updateError(error))
                dispatch(HPostsDetailAction.requestCompleted)
            }
        }
    }
    
    static func requestComments(_ service: ServiceProtocol) -> AppThunkAction {
        AppThunkAction { dispatch, getState in
            dispatch(HPostsDetailAction.requestStart)
            dispatch(HPostsDetailAction.updateError(nil))
            dispatch(HPostsDetailAction.updateComments(nil))
            service.getComments{ (data) in
                dispatch(HPostsDetailAction.updateComments(data))
                dispatch(HPostsDetailAction.requestCompleted)
            } onError: { (error) in
                dispatch(HPostsDetailAction.updateError(error))
                dispatch(HPostsDetailAction.requestCompleted)
            }
        }
    }
}


