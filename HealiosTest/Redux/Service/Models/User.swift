//
//  User.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Foundation

struct User: Codable {
    var id: Int
    var name, username, email: String
    var address: Address
    var phone, website: String
    var company: Company
}

// MARK: - Address
struct Address: Codable {
    var street, suite, city, zipcode: String
    var geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    var lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    var name, catchPhrase, bs: String
}

