//
//  LoggingMiddleware.swift
//  IpData
//
//  Created by Anton on 16.03.2021.
//

import Foundation
import ReSwift

func createLoggingMiddleware() -> Middleware<AppState> {
    return { _, _ in
        { next in
            { action in
                print("[dispatch]: \(action)")
                next(action)
            }
        }
    }
}
