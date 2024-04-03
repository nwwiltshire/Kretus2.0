//
//  UPCProducts.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 1/17/24.
//

import Foundation

var upcList: [Product] = load("upc.json")

func loadUpcList() -> [Product] {
    return load("upc.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


// Add: Aggregate or liquid bool (technically bool representing if it can be sqft/gal or sqft/kit.

// Add: Thickness Ranges (in old app it's displayed in system/coat specs)

// Add: Unit of measure for thickness

