//
//  BundleFileManager.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 06/09/2024.
//

import Foundation
import SwiftUI

public struct JsonDeveloperCodable: Codable {
    let id: Int
    let store: String
    let appColor: Int
    let fontFamily: String
}

class AppSettings {
    static let shared = AppSettings()
    
    private init() {
        loadSettings()
    }

    private(set) var primaryColor: Color = .blue
    private(set) var primaryFont: Font = .body
    private(set) var storeIdentifier: Int = 0

    private func loadSettings() {
        let devConfig = BundleFileManager.shared.readJsonDeveloperFile(filename: "Developers", Type: "json")
        primaryColor = Color(hex: "\(devConfig.appColor)")
        primaryFont = Font.custom(devConfig.fontFamily, size: 15)
        storeIdentifier = devConfig.id
    }
}

class BundleFileManager {
    static let shared = BundleFileManager()

    func readJsonDeveloperFile(filename: String, Type: String) -> JsonDeveloperCodable {
        guard let filePath = Bundle.main.path(forResource: filename, ofType: Type) else {
            return JsonDeveloperCodable(id: 1, store: "Developers", appColor: 234455, fontFamily: "dinnextltarabic-regular")
        }
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonDeveloper = try decoder.decode(JsonDeveloperCodable.self, from: data)
            return jsonDeveloper
        } catch {
            print("Error reading or decoding JSON file: \(error)")
        }
        return JsonDeveloperCodable(id: 1, store: "Developers", appColor: 234455, fontFamily: "dinnextltarabic-regular")
    }
}
