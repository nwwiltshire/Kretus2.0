//
//  SystemData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/23/24.
//


import Foundation
import SwiftData

@Model
final class Build {
    var name: String
    var squareFt: Int
    
    
    init(name: String,
         squareFt: Int) {
        self.name = name
        self.squareFt = squareFt
    }
}

