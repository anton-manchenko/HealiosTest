//
//  Comment.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Foundation

struct Comment: Codable {
    var postID, id: Int
    var name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
