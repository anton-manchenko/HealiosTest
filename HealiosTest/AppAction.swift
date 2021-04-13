//
//  AppAction.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Combine
import CombineRex
import SwiftRex
import SwiftUI

enum AppAction {
    case count(CountAction)
    case shake(ShakeAction)
    case appLifecycle(AppLifecycleAction)
}

enum CountAction {
    case increment
    case decrement
}
enum ShakeAction {
    case startMonitoring
    case shaken
    case stopMonitoring
}
public enum AppLifecycleAction {
    case start
    case willEnterForeground
    case didEnterBackground
}

extension AppAction {
    public var count: CountAction? {
        guard case let .count(value) = self else { return nil }
        return value
    }
    public var shake: ShakeAction? {
        guard case let .shake(value) = self else { return nil }
        return value
    }
    public var appLifecycle: AppLifecycleAction? {
        guard case let .appLifecycle(value) = self else { return nil }
        return value
    }
}
