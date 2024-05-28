//
//  BroadcastData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation
import SwiftData

@Model
final class BroadcastData {
    let broadcastType: String
    let thickness: String
    
    init(broadcastType: String, thickness: String) {
        self.broadcastType = broadcastType
        self.thickness = thickness
    }
}
