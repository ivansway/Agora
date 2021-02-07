//
//  MainModel.swift
//  Agora
//
//  Created by Ivan Myrza on 03.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import Foundation

// MARK: - MainStorageElement
struct MainStorageElement: Decodable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Decodable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Decodable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Decodable {
    let name, catchPhrase, bs: String
}

