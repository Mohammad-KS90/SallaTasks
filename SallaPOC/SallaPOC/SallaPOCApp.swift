//
//  SallaPOCApp.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 04/09/2024.
//

import SwiftUI

@main
struct SallaPOCApp: App {

    @StateObject var appData = AppConfig()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color(hex: String(describing: appData.globalVariable.appColor))) // Set the background once here
        }
    }
}
