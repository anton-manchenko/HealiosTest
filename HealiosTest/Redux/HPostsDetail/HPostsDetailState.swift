//
//  HPostsState.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Combine
import Foundation
import ReSwift

struct HPostsDetailState: StateType {
    enum LoadingState: Equatable {
        case initial
        case loaded
    }
    var loadingState: LoadingState = .initial
    var listenerCancellable: AnyCancellable?
    var requesting: Bool = false
    var users: [User]?
    var comments: [Comment]?
    var error: AppError?
}
