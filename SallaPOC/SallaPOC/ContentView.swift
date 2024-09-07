//
//  ContentView.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appData = AppConfig()

    var body: some View {

        BrandsSwiftUIView()
            .font(.custom(appData.globalVariable.fontFamily, size: 16))
    }
}
