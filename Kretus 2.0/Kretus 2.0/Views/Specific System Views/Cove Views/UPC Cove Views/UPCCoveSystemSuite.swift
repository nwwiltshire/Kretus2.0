//
//  UPCCoveSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct UPCCoveSystemSuite: View {
    
    @ObservedObject var upcCoveSystem: UPCCoveSystem
    
    var body: some View {
        ScrollView {
            UPCCoveCoatOptions(upcCoveSystem: upcCoveSystem)
            UPCCoveSystemCommitButton(upcCoveSystem: upcCoveSystem)
        }
    }
}

struct UPCCoveSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCCoveSystem()
        
        UPCCoveSystemSuite(upcCoveSystem: mockSystem)
    }
}
