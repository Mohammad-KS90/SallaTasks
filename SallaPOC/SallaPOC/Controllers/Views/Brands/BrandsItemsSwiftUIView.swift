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
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.prands) { prand in
                    NavigationLink(destination:
                                    ItemDetailsSwiftUIView(productId: prand.id)
                    ) {
                        ItemSwiftUIView(prand: prand, addToCart: { product, qty in
                            print(product, qty)
                        })
                    }
                    .onAppear {
                        if prand.id == viewModel.prands.last?.id {
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
