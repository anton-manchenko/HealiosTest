//
//  ServiceMocks.swift
//  HealiosTestTests
//
//  Created by Anton on 13.04.2021.
//

import Foundation
@testable
import HealiosTest

internal class NilServiceData: ServiceProtocol {
    func getPosts(onSucces: @escaping (_ data: [Post]?)->(), onError: @escaping (_ error: AppError) -> ()){
        onSucces(nil)
    }
    func getUsers(onSucces: @escaping (_ data: [User]?)->(), onError: @escaping (_ error: AppError) -> ())
    {
        onSucces(nil)
    }
    func getComments(onSucces: @escaping (_ data: [Comment]?)->(), onError: @escaping (_ error: AppError) -> ())
    {
        onSucces(nil)
    }
}

internal class ErrorServiceData: ServiceProtocol {
    func getPosts(onSucces: @escaping (_ data: [Post]?)->(), onError: @escaping (_ error: AppError) -> ()){
        onError(AppError.serviceError("Test_Error"))
    }
    func getUsers(onSucces: @escaping (_ data: [User]?)->(), onError: @escaping (_ error: AppError) -> ())
    {
        onError(AppError.serviceError("Test_Error"))
    }
    func getComments(onSucces: @escaping (_ data: [Comment]?)->(), onError: @escaping (_ error: AppError) -> ())
    {
        onError(AppError.serviceError("Test_Error"))
    }
}

internal class NotNilServiceData: ServiceProtocol {
    func getPosts(onSucces: @escaping (_ data: [Post]?)->(), onError: @escaping (_ error: AppError) -> ()){
        onSucces([Post(userID: 1,
                       id: 1,
                       title: "PostTitle",
                       body: "PostBody")])
    }
    func getUsers(onSucces: @escaping (_ data: [User]?)->(), onError: @escaping (_ error: AppError) -> ())
    {
        onSucces([User(id: 1,
                       name: "Name",
                       username: "UserName",
                       email: "test@email.com",
                       address: Address(street: "street", suite: "sute", city: "city", zipcode: "zipcode", geo: Geo(lat: "0", lng: "0")),
                       phone: "phone",
                       website: "website",
                       company: Company(name: "name", catchPhrase: "catchPhrase", bs: "bs"))])
    }
    func getComments(onSucces: @escaping (_ data: [Comment]?)->(), onError: @escaping (_ error: AppError) -> ())
    {
        onSucces([Comment(postID: 1,
                          id: 1,
                          name: "name",
                          email: "email",
                          body: "body")])
    }
}
