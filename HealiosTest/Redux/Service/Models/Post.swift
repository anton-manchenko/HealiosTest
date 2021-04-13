//
//  PostModel.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Foundation

struct Post: Codable {
    var userID, id: Int
    var title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
