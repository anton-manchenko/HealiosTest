//
//  HPostsState.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Combine
import Foundation
import ReSwift

struct HPostsState: StateType {
    enum LoadingState: Equatable {
        case initial
        case loaded
    }
    var loadingState: LoadingState = .initial
    var listenerCancellable: AnyCancellable?
    var requesting: Bool = false
    var posts: [Post]?
    var error: AppError?
}
