//
//  BrandsImagesScrollView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct BrandsImagesScrollView: View {
    
    // Example list of images (you can replace these with your own image names or URLs)
    let imageNames = ["armani", "armani", "armani", "armani", "armani"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 2) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 150)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
    }
}
