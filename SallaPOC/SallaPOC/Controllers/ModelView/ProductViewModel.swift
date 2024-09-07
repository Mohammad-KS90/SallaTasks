//
//  ProductViewModel.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 05/09/2024.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    private let productService = ProductOperationsService()
    
    @Published var products: [Product] = []
    
    @Published var errorMessage: String?
    public var hasMorePages = true

    var page = 1
    var limit = 20
    
    init() {
//        loadProducts()
    }
    
    func loadProducts() {
        guard hasMorePages else { return }

        productService.fetchProducts(page: page, limit: limit)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { response in
                if let data = response.data {
                    self.products.append(contentsOf: data)
                }
                if response.cursor != nil {
                    self.page+=1
                } else {
                    self.hasMorePages = false
                }
            })
            .store(in: &cancellables)
    }
}
