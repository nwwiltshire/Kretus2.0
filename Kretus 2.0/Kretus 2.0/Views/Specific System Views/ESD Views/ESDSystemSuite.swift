//
//  ESDSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ESDSystemSuite: View {
    
    @ObservedObject var esdSystem: ESDSystem
    
    var body: some View {
        
        ESDCoatOptions(esdSystem: esdSystem)
        ESDSystemCommitButton(esdSystem: esdSystem)
        
    }
    
}
struct ESDSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ESDSystem()
        
        ESDSystemSuite(esdSystem: mockSystem)
    }
}
