//
//  NetworkManager.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import Foundation
import Alamofire
import Combine

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

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseUrlString = "https://api.salla.dev/"
    private let versionApi = "store/v1/"
    
    private let sessionManager: Session
    private let reachabilityManager = NetworkReachabilityManager()

    private init() {
        // Create a ServerTrustManager with certificate pinning
        
        // setup cach size
        let cacheSizeMemory: Int = 20 * 1024 * 1024 // 20 MB
        let cacheSizeDisk: Int = 100 * 1024 * 1024 // 100 MB
        let urlCache = URLCache(memoryCapacity: cacheSizeMemory, diskCapacity: cacheSizeDisk, diskPath: nil)
        URLCache.shared = urlCache

        // Configure Alamofire Session
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache.shared
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        self.sessionManager = Session(configuration: configuration)
    }
        
    func fetchCachedData<T: Decodable>(from url: String, responseType: T.Type) -> ResponseDataModel<T>? {
        
        guard let url = URL(string: url) else { return nil }
        let request = URLRequest(url: url)
        
        // Fetch cached response
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(ResponseDataModel<T>.self, from: cachedResponse.data)
                return responseData
            } catch {
                print("Failed to decode cached data: \(error)")
            }
        }
        
        return nil
    }


    func request<T: Decodable>(_ request: NetworkRequest, responseType: T.Type) -> AnyPublisher<ResponseDataModel<T>, Error> {
        let urlStr = self.baseUrlString + self.versionApi + request.endpoint

        guard let isReachable = reachabilityManager?.isReachable, isReachable else {
            if let cachedData = self.fetchCachedData(from: urlStr, responseType: T.self) {
                return Just(cachedData)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                return Fail(error: NSError(domain: NSURLErrorDomain, code: NSURLErrorNotConnectedToInternet, userInfo: nil))
                    .eraseToAnyPublisher()
            }
        }
        
        return Future<ResponseDataModel<T>, Error> { promise in
            guard let url = URL(string: urlStr) else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let afMethod = HTTPMethod(rawValue: request.method.rawValue)
            let encoding: ParameterEncoding
            
            switch request.encoding {
            case .url:
                encoding = URLEncoding.default
            case .json:
                encoding = JSONEncoding.default
            }
            
            self.sessionManager.request(url, method: afMethod, parameters: request.parameters, encoding: encoding, headers: request.headers)
                .validate(statusCode: 200..<300) // Validate status codes in the 200 range
                .responseDecodable(of: ResponseDataModel<T>.self) { response in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
