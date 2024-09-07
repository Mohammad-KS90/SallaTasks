//
//  BundleFileManager.swift
//  SallaPOC
//
//  Created by Mohammad kh Suliman on 06/09/2024.
//

import Foundation

public struct JsonDeveloperCodable: Codable {
    let id: Int
    let store: String
    let appColor: Int
    let fontFamily: String
}


class AppConfig: ObservableObject {

    @Published public var globalVariable: JsonDeveloperCodable = (BundleFileManager().readJsonDeveloperFile(filename: "Developers", Type: "json") ?? JsonDeveloperCodable(id: 1, store: "Developers", appColor: 234455, fontFamily: "dinnextltarabic-regular"))
    
}

class BundleFileManager {
    
    func readJsonDeveloperFile(filename: String, Type: String) -> JsonDeveloperCodable? {
        guard let filePath = Bundle.main.path(forResource: filename, ofType: Type) else {
            return nil
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
        return nil
    }
}
