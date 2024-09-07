//
//  BrandLogoSwiftUIView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct BrandLogoSwiftUIView: View {

    @State private var isDescriptionVisible: Bool = true
    @State private var brandLogo: String = "brand.png"
    @State private var description: String = "armani brand description text, !!!"

    var body: some View {
        VStack(spacing: 1) {
            Button(action: {
                withAnimation {
                    isDescriptionVisible.toggle()
                }
            }, label: {
                VStack {
                    Image("brand.png", bundle: Bundle.main)
                        .resizable()
                        .frame(width: 70, height: 50)
                }
                .padding()
                .cornerRadius(10)
            })
            if isDescriptionVisible {
                Text(description)
                    .padding()
                    .transition(.slide)
            }
        }
    }
}
