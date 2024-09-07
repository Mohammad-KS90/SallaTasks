//
//  ItemDetailsSwiftUIView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct ItemDetailsSwiftUIView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State var productId: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.product?.name ?? "")
                .font(AppSettings.shared.primaryFont)
                .fontWeight(.bold)
                .padding(.top, 20)
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: viewModel.product?.image?.url ?? "")) { phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "photo")
                            .font(AppSettings.shared.primaryFont)
                    case .success(let image):
                        image
                            .resizable()
                    default:
                        ProgressView()
                    }
                }
                .frame(width: 320, height: 250)
                .clipShape(.rect(cornerRadius: 25))

                // Badge
                Text("عرض لا يقاوم")
                    .font(AppSettings.shared.primaryFont)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding([.top, .leading], 5)
                    .rotationEffect(.degrees(-40)) // Rotating the label by 60 degrees
            }
            
            // Price and CTA
            VStack(alignment: .trailing, spacing: 10) {
                Text("اشترِ الآن وادفع الآن")
                    .foregroundColor(.gray)
                    .padding([.top, .leading], 5)
                
                Text(String(format: "SAR %.2f", (viewModel.product?.price ?? 0.0)))
                    .font(AppSettings.shared.primaryFont)
                    .padding([.leading], 5)

            }
            .padding(.bottom, 20)
            Spacer()
            // Action Buttons
            HStack {
                Button(action: {
                    // Add your favorite action here
                }) {
                    Image(systemName: "heart")
                        .font(AppSettings.shared.primaryFont)
                        .foregroundColor(.gray)
                        .padding()
                }
                Spacer()
                Button(action: {
                    // Add your share action here
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(AppSettings.shared.primaryFont)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppSettings.shared.primaryColor)
        .task {
            viewModel.getProductById(id: productId)
        }
    }
}
