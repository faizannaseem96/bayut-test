//
//  ProductViewModel.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import Foundation

struct ProductViewModel {
    let createdAt: String
    let price: String
    let name: String
    let imageUrl: String
    let imageThumnail: String
    
    // Dependency Injection (DI)
    init(product: Product) {
        self.price = product.price
        self.name = product.name
        self.imageUrl = product.image_urls.first ?? ""
        self.imageThumnail = product.image_urls_thumbnails.first ?? ""
        
        if let index = product.created_at.firstIndex(of: ".") {
            let date = product.created_at[product.created_at.startIndex..<index]
            self.createdAt = date.description.changeDateFormat(withFormat: "yyyy-MM-dd HH:mm:ss", ToFormat: "MMM d, yyyy")
        } else {
            self.createdAt = ""
        }
    }
}
