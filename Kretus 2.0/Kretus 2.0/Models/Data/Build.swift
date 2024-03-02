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
    
    init(name: String) {
        self.name = name
    }
}


