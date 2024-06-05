//
//  EpoxyColorQuartzSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/3/24.
//

import Foundation
import SwiftUI

struct EpoxyColorQuartzSystemSuite: View {
    
    @ObservedObject var epoxyColorQuartzSystem: EpoxyColorQuartzSystem
    
    var body: some View {
        ScrollView {
            EpoxyColorQuartzCoatOptions(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
            EpoxyColorQuartzSystemCommitButton(epoxyColorQuartzSystem: epoxyColorQuartzSystem)
        }
    }
}

struct ColorQuartzEpoxySystemSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyColorQuartzSystem()
        
        EpoxyColorQuartzSystemSuite(epoxyColorQuartzSystem: mockSystem)
    }
}
