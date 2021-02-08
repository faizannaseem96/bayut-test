//
//  Product.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import Foundation

struct Product: Decodable {
    var created_at: String
    var price: String
    var name: String
    var image_urls: [String]
    var image_urls_thumbnails: [String]
}

struct ProductResult: Decodable {
    var data: [Product]
    
    enum CodingKeys: String, CodingKey {
        case data = "results"
    }
}
