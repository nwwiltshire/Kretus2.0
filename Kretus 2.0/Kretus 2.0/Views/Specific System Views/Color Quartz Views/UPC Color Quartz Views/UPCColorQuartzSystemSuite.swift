//
//  UPCColorQuartzSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct UPCColorQuartzSystemSuite: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    var body: some View {
        ScrollView {
            UPCColorQuartzCoatOptions(upcColorQuartzSystem: upcColorQuartzSystem)
            UPCColorQuartzSystemCommitButton(upcColorQuartzSystem: upcColorQuartzSystem)
        }
    }
}

struct ColorQuartzUPCSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCColorQuartzSystem()
        
        UPCColorQuartzSystemSuite(upcColorQuartzSystem: mockSystem)
    }
}
