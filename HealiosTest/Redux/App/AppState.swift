//
//  AppState.swift
//  IpData
//
//  Created by Anton on 16.03.2021.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var hPostsState: HPostsState = .init()
    var hPostDetailState: HPostsDetailState = .init()
}
