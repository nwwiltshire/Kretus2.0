//
//  SystemData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/23/24.
//


import Foundation
import SwiftData

@Model
final class UPCSystemData {
  let name: String
  let imageName: String
  let viewColor: String
  
  var subType: String
  var systemColor: String
  var baseCoat: UPCCoatData
  var primeCoat: UPCCoatData?
  var topCoat: UPCCoatData?
  var uvResistance: Bool
  
  var squareFt: Int
  var kitsNeeded: [Kit]
  
  // Initializer with all parameters
  init(name: String, imageName: String, viewColor: String, subType: String, systemColor: String, baseCoat: UPCCoatData, primeCoat: UPCCoatData? = nil, topCoat: UPCCoatData? = nil, uvResistance: Bool, squareFt: Int, kitsNeeded: [Kit]) {
    self.name = name
    self.imageName = imageName
    self.viewColor = viewColor
    self.subType = subType
    self.systemColor = systemColor
    self.baseCoat = baseCoat
    self.primeCoat = primeCoat
    self.topCoat = topCoat
    self.uvResistance = uvResistance
    self.squareFt = squareFt
    self.kitsNeeded = kitsNeeded
  }
}


