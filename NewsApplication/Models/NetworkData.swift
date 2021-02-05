//
//  NetworkData.swift
//  newsApplication
//
//  Created by Zharkyngali Savanbay on 05.02.2021.
//  Copyright © 2021 Zharkyngali Savanbay. All rights reserved.
//

import Foundation

struct NetworkData: Decodable {
    let articles: [Properties]
}

struct Properties: Decodable, Identifiable {
    var id: String {
        return source.id ?? ""
    }
    let source: Source
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
