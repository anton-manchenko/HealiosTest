//
//  ServiceIpEndpoints.swift
//  IpData (iOS)
//
//  Created by Anton on 16.03.2021.
//
import Foundation
import Alamofire

enum ServiceIpEndpoint {
    internal static let rootUrl = "http://jsonplaceholder.typicode.com"
    
    case posts
    case users
    case comments
}

extension ServiceIpEndpoint: URLRequestConvertible {
    var method: Alamofire.HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    var path: String {
        switch self {
        case .posts:
            return "/posts"
        case .users:
            return "/users"
        case .comments:
            return "/comments"
        }
    }
    func asURLRequest() throws -> URLRequest
        {
            let url = try ServiceIpEndpoint.rootUrl.asURL()

            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue

            switch self {
            default:
                urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
            }

            return urlRequest
        }
}
