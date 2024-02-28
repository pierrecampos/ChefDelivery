//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 19/02/24.
//

import Foundation

class StoreType: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    
    init(id: Int, name: String, logoImage: String, headerImage: String, location: String, stars: Int, products: [ProductType]) {
        self.id = id
        self.name = name
        self.logoImage = logoImage
        self.headerImage = headerImage
        self.location = location
        self.stars = stars
        self.products = products
    }
}
