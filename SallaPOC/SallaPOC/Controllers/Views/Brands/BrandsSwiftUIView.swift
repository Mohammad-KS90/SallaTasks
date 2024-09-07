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
        Text("Brand: Armani")
        BrandsImagesScrollView()
        BrandLogoSwiftUIView()
        BrandsItemsSwiftUIView()
    }
}
