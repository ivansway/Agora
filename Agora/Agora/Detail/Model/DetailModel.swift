//
//  DetailModel.swift
//  Agora
//
//  Created by Ivan Myrza on 04.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import Foundation

struct DetailElement: Decodable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?
}
