//
//  ProductOperations.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import Combine
import Foundation
import Alamofire

protocol ProductRepository {
    
    var networkManager: NetworkManager { set get }
    var headers: HTTPHeaders { set get }
    func fetchBrands(page: Int, limit: Int)-> AnyPublisher<ResponseDataModel<[Prand]>, Error>
    func fetchProductById(id: String) -> AnyPublisher<ResponseDataModel<Product>, Error>
}


class ProductOperationsService: ProductRepository {
    var networkManager: NetworkManager
    
    var headers: HTTPHeaders  = ["Store-Identifier": "\(AppSettings.shared.storeIdentifier)", "Currency" : "SAR", "AppVersion" : "3.0.0"]

    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }

    func fetchBrands(page: Int, limit: Int) -> AnyPublisher<ResponseDataModel<[Prand]>, Error>{
        
        let endpoint = SallaApiEndPoint.brands.endpoint + "?page=\(page)&per_page=\(limit)"
        print(endpoint)
        let request = NetworkRequest(endpoint: endpoint,
                                     method: .get,
                                     headers: headers,
                                     encoding: .json)
        
        return networkManager.request(request, responseType: [Prand].self)
    }
    
    func fetchProductById(id: String) -> AnyPublisher<ResponseDataModel<Product>, Error>{
        
        let endpoint = SallaApiEndPoint.productsByID(id: id).endpoint
        
        let request = NetworkRequest(endpoint: endpoint,
                                     method: .get,
                                     headers: headers,
                                     encoding: .json)
        
        return networkManager.request(request, responseType: Product.self)
    }
    
}
