//
//  CoatKitRelationship.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/28/24.
//

import Foundation
import SwiftData

@Model
final class CoatKitRelationship {
  let coatData: CoatData
  let kit: KitData

  init(coatData: CoatData, kit: KitData) {
    self.coatData = coatData
    self.kit = kit
  }
}
