//
//  EpoxyCoveSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct EpoxyCoveSystemSuite: View {
    
    @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
    
    var body: some View {
        ScrollView {
            EpoxyCoveCoatOptions(epoxyCoveSystem: epoxyCoveSystem)
            EpoxyCoveSystemCommitButton(epoxyCoveSystem: epoxyCoveSystem)
        }
    }
}

struct EpoxyCoveSystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyCoveSystem()
        
        EpoxyCoveSystemSuite(epoxyCoveSystem: mockSystem)
    }
}
