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

var tsList: [Product] = load("ts.json")

func loadTsList() -> [Product] {
    return load("ts.json")
}

var paList: [Product] = load("pa.json")

func loadPaList() -> [Product] {
    return load("pa.json")
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

