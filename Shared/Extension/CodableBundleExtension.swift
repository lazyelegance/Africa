//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ezra Bathini on 3/01/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to get contents of \(file) in bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("Unable to decode contents of \(file) in bundle")
        }
        
        return loaded
    }
}
