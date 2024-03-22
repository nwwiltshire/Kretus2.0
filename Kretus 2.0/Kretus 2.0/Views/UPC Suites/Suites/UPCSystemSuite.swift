//
//  UPCSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/17/24.
//

import Foundation
import SwiftUI

struct UPCSystemSuite: View {
    
    @State var upcSystem: UPCSystemData
    
    var body: some View {
        VStack {
            UPCCoatOptions(upcSystem: upcSystem)
            UPCSubSystemPicker(upcSystem: upcSystem)
            UPCColorPicker(upcSystem: upcSystem)
            UPCSystemCommitButton(upcSystem: upcSystem)
        }
    }
}





struct UPCSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystemData()

        // Pass the mock System instance into SystemBuilderView
        UPCSystemSuite(upcSystem: mockSystem)
    }
}
