//
//  ItemSwiftUIView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct ItemSwiftUIView: View {
    var product: Product
    let addToCart: (_ product: Product,_ qty: Double) -> Void
    
    @State private var isAddedToCart: Bool = false

    var body: some View {
        VStack {
            // Placeholder for the product image
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding()

            Text(product.name ?? "N/A")
                .foregroundColor(.white)

            Text("$\(String(format: "%.2f", product.price ?? 0.0))")
                .foregroundColor(.white)

            // "Add to Cart" button
            Button(action: {
                isAddedToCart.toggle()
                addToCart(product, 1)
            }) {
                Text(isAddedToCart ? "Added" : "Add to Cart")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isAddedToCart ? Color.green : Color.gray)
                    .cornerRadius(8)
            }
            .padding(.top, 10)
        }
        .frame(height: 250)
        .padding()
        .background(Color(.white.withAlphaComponent(0.2)))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
