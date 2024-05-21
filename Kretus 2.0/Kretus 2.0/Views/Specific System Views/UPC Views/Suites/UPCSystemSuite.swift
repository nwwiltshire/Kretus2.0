//
//  UPCSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/17/24.
//

import Foundation
import SwiftUI

struct UPCSystemSuite: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    var body: some View {
        
        VStack {
            UPCSubSystemPicker(upcSystem: upcSystem)
            UPCCoatOptions(upcSystem: upcSystem)
            UPCColorPicker(upcSystem: upcSystem)
            UPCSystemCommitButton(upcSystem: upcSystem)
        }
    }
}





struct UPCSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCSystemSuite(upcSystem: mockSystem)
    }
}
