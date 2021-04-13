//
//  ServiceIpApi.swift
//  IpData (iOS)
//
//  Created by Anton on 16.03.2021.
//

import Foundation
import Combine
import Alamofire

struct ServiceHPApi: ServiceProtocol {
    func getPosts(onSucces: @escaping (_ data: [Post]?)->(), onError: @escaping (_ error: AppError) -> ()){
        AF.request(ServiceIpEndpoint.posts)
            .responseDecodable(of: [Post].self) { (response) in
                if let error = response.error {
                    onError(AppError.serviceError(error.localizedDescription))
                } else if let data = response.value {
                    onSucces(data)
                } else {
                    onSucces(nil)
                }
            }
    }
    func getUsers(onSucces: @escaping (_ data: [User]?)->(), onError: @escaping (_ error: AppError) -> ()){
        AF.request(ServiceIpEndpoint.users)
            .responseDecodable(of: [User].self) { (response) in
                if let error = response.error {
                    onError(AppError.serviceError(error.localizedDescription))
                } else if let data = response.value {
                    onSucces(data)
                } else {
                    onSucces(nil)
                }
            }
    }
    
    func getComments(onSucces: @escaping (_ data: [Comment]?)->(), onError: @escaping (_ error: AppError) -> ()){
        AF.request(ServiceIpEndpoint.comments)
            .responseDecodable(of: [Comment].self) { (response) in
                if let error = response.error {
                    onError(AppError.serviceError(error.localizedDescription))
                } else if let data = response.value {
                    onSucces(data)
                } else {
                    onSucces(nil)
                }
            }
    }
}
