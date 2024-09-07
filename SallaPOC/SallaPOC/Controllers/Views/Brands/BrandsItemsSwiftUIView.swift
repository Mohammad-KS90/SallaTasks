//
//  BrandsItemsSwiftUIView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct BrandsItemsSwiftUIView: View {
    @StateObject private var viewModel = ProductViewModel()
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.products) { product in
                    ItemSwiftUIView(product: product, addToCart: { product, qty in
                        print(product, qty)
                    })
                        .onAppear {
                            if product.id == viewModel.products.last?.id {
                                Task {
                                    viewModel.loadProducts()
                                }
                            }
                        }
                }
            }
            .padding()
        }
        .task {
            viewModel.loadProducts()
        }
    }
}
