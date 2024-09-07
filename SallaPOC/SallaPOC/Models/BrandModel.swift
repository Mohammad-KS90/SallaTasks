//
//  BrandModel.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 05/09/2024.
//

import Foundation

struct Prand: Decodable, Identifiable {
    let id: String
    let name: String?
    let price: Double?
    let description: String?
    let currency: String?
    let image: ImageObject?

}

struct Product: Decodable, Identifiable {
    let id: Int
    let name: String?
    let description: String?
    let price: Double?
    let currency: String?
    let image: ImageObject?
}

struct ImageObject: Decodable {
    let url: String?
}
