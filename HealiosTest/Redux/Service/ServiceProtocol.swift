//
//  ServiceProtocol.swift
//  IpData (iOS)
//
//  Created by Anton on 16.03.2021.
//

import Foundation
import Combine

enum AppError: Error {
    case serviceError(String)
}

protocol ServiceProtocol {
    func getPosts(onSucces: @escaping (_ data: [Post]?)->(), onError: @escaping (_ error: AppError) -> ())
    func getUsers(onSucces: @escaping (_ data: [User]?)->(), onError: @escaping (_ error: AppError) -> ())
    func getComments(onSucces: @escaping (_ data: [Comment]?)->(), onError: @escaping (_ error: AppError) -> ())
}
