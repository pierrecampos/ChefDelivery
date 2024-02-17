//
//  DataSourceMock.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 16/02/24.
//

import Foundation

let orderMocks: [OrderType] = [
    OrderType(id: UUID(), name: "Restaurantes", image: "hamburguer"),
    OrderType(id: UUID(), name: "Mercado", image: "mercado"),
    OrderType(id: UUID(), name: "Farmácia", image: "farmacia"),
    OrderType(id: UUID(), name: "Pet", image: "petshop"),
    OrderType(id: UUID(), name: "Descontos", image: "descontos"),
    OrderType(id: UUID(), name: "Bebidas", image: "bebidas"),
    OrderType(id: UUID(), name: "Gourmet", image: "gourmet"),
]

let bannerMocks: [OrderType] = [
    OrderType(id: UUID(), name: "barbecue-banner", image: "barbecue-banner"),
    OrderType(id: UUID(), name: "brazilian-meal-banner", image: "brazilian-meal-banner"),
    OrderType(id: UUID(), name: "pokes-banner", image: "pokes-banner"),
]
