//
//  KitRelationship.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/17/24.
//

import Foundation
import SwiftData

@Model
final class KitRelationship {
  let systemData: SystemData
  let kit: KitData

  init(systemData: SystemData, kit: KitData) {
    self.systemData = systemData
    self.kit = kit
  }
}
