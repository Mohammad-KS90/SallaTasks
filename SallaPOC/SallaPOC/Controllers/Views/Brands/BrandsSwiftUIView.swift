//
//  BrandsSwiftUIView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI
import Combine
import Foundation

struct BrandsSwiftUIView: View {

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content.background(AppSettings.shared.primaryColor)
            }
        } else {
            NavigationView {
                content.background(AppSettings.shared.primaryColor)
            }
        }
    }
    private var content: some View {
        VStack {
            BrandsImagesScrollView()
            BrandLogoSwiftUIView()
            BrandsItemsSwiftUIView()
        }
        .padding()

    }
}
