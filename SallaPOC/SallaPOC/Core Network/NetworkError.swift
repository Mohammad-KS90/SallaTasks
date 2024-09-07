//
//  NetworkError.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 07/09/2024.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed
    case customError(String)
    case unknown(Error)
}

enum HTTPMethodType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ParameterEncodingType {
    case url
    case json
}

struct NetworkRequest {
    let endpoint: String
    let method: HTTPMethodType
    let parameters: [String: Any]?
    let headers: HTTPHeaders?
    let encoding: ParameterEncodingType
    
    init(endpoint: String,
         method: HTTPMethodType = .get,
         parameters: [String: Any]? = nil,
         headers: HTTPHeaders? = nil,
         encoding: ParameterEncodingType = .url) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.encoding = encoding
    }
}

struct Cursor: Decodable, Identifiable {
    let id: Int?
    let current: String?
    let next: String?
}

public struct ResponseDataModel<T: Decodable>: Decodable {
    
    let status: Int
    let success: Bool?
    let data: T?
    let cursor: Cursor?
}
