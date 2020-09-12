//
//  App.swift
//  App Store
//
//  Created by Frederico Augusto on 12/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avaliacao: String?
    let iconeUrl: String
    let screenshotUrls: [String]?
}
