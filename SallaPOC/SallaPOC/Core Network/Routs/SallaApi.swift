//
//  SallaApi.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import Foundation

enum SallaApiEndPoint {
    case brands
    case products
    case productsByID(id: String)
    
    var endpoint: String {
        switch self {
        case .brands:
            "brands/1724782240"
        case .products:
            "products/"
        case .productsByID(id: let id):
            "products/\(id)/details"
        }
    }
}
