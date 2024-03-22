//
//  UPCKitData.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/19/24.
//

import Foundation
import SwiftData

@Model
final class KitData {
    var product: ProductData
    var quantity: Int
        
    init(product: ProductData, quantity: Int) {
      self.product = product
      self.quantity = quantity
    }
}
