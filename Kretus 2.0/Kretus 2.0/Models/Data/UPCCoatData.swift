//
//  UPCCoatData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/19/24.
//

import Foundation
import SwiftData

@Model
final class UPCCoatData {
    var name: String
    var squareFt: Int

    var coatType: UPCSystemData.CoatType
    var subType: UPCSystemData.SubType
    var speed: UPCSystemData.Speed
    var covRate: Int

    var partA: ProductData
    var partB: ProductData
    var partC: ProductData

    var thickness: UPCSystemData.Thickness

    var wasteFactor: Int
    var texture1: UPCSystemData.Texture
    var texture2: UPCSystemData.Texture
  
    init(name: String, squareFt: Int, coatType: UPCSystemData.CoatType, subType: UPCSystemData.SubType, speed: UPCSystemData.Speed, covRate: Int, partA: ProductData, partB: ProductData, partC: ProductData, thickness: UPCSystemData.Thickness, wasteFactor: Int, texture1: UPCSystemData.Texture, texture2: UPCSystemData.Texture) {
        self.name = name
        self.squareFt = squareFt
        self.coatType = coatType
        self.subType = subType
        self.speed = speed
        self.covRate = covRate
        self.partA = partA
        self.partB = partB
        self.partC = partC
        self.thickness = thickness
        self.wasteFactor = wasteFactor
        self.texture1 = texture1
        self.texture2 = texture2
    }
}

