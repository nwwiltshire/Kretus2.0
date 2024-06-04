//
//  UPCColorQuartzBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI


struct UPCColorQuartzBuildSuite: View {
    
    @ObservedObject var upcColorQuartzSystem: UPCColorQuartzSystem
    
    var body: some View {
        Text("Hello")
    }
}

struct UPCColorQuartzBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCColorQuartzSystem()
        
        UPCColorQuartzBuildSuite(upcColorQuartzSystem: mockSystem)
    }
}
