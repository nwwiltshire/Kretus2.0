//
//  MetallicSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/10/24.
//

import Foundation
import SwiftUI

struct MetallicSystemSuite: View {
    
    @ObservedObject var metallicSystem: MetallicSystem
    
    var body: some View {
        
        ScrollView {
            MetallicCoatOptions(metallicSystem: metallicSystem)
            MetallicSystemCommitButton(metallicSystem: metallicSystem)
        }
        
    }
    
}
struct MetallicSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = MetallicSystem()
        
        MetallicSystemSuite(metallicSystem: mockSystem)
    }
}
