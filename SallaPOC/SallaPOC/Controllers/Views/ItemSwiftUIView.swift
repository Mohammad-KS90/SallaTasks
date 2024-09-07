//
//  ItemSwiftUIView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct ItemSwiftUIView: View {
    var prand: Prand
    let addToCart: (_ product: Prand,_ qty: Double) -> Void
    
    @State private var isAddedToCart: Bool = false

    var body: some View {
        VStack {
            // Placeholder for the product image
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .padding()

            Text(prand.name ?? "N/A")
                .font(AppSettings.shared.primaryFont)
                .foregroundColor(.black)

            Text("$\(String(format: "%.2f", prand.price ?? 0.0))")
                .font(AppSettings.shared.primaryFont)
                .foregroundColor(.black)

            // "Add to Cart" button
            Button(action: {
                isAddedToCart.toggle()
                addToCart(prand, 1)
            }) {
                Text(isAddedToCart ? "Added" : "Add to Cart")
                    .foregroundColor(.black)
                    .font(AppSettings.shared.primaryFont)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isAddedToCart ? Color.green : Color.gray)
                    .cornerRadius(8)
            }
            .padding(.top, 10)
        }
        .frame(height: 250)
        .padding()
        .background(Color(.white))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
