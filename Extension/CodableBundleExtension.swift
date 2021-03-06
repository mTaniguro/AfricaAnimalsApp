//
//  CodableBundleExtension.swift
//  AfricaAnimals
//
//  Created by mami taniguro on 5/24/21.
//

import Foundation

extension Bundle {
    func decode (_ file: String) -> [CoverImage] {
        
        // Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // Create a property for the data
        guard  let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // Create a decoder
        let decoder = JSONDecoder()
        
        // Create a property for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // Return the ready-to-use data
        return loaded
    }
}
