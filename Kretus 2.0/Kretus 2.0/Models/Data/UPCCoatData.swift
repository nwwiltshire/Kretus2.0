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
  
  var coatType: String
  var subType: String
  var speed: String
  var covRate: Int
  
  var partA: Product
  var partB: Product
  var partC: Product
  
  var thickness: String
  
  var wasteFactor: Int
  var texture1: String
  var texture2: String
  
  init(name: String, squareFt: Int, coatType: String, subType: String, speed: String, covRate: Int, partA: Product, partB: Product, partC: Product, thickness: String, wasteFactor: Int, texture1: String, texture2: String) {
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

