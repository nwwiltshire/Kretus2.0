//
//  ColorChipBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct ColorChipBuildSuite: View {
    
    @ObservedObject var colorChipSystem: ColorChipSystem
    
    @State private var showSheet = false
    
    @State private var printedText: String? = nil
    
    var body: some View {
        ScrollView {
            
            TotalSystemView(system: colorChipSystem)
            
            ColorChipBroadcastBuild(broadCast: colorChipSystem.broadcast, viewColor: colorChipSystem.viewColor)
            
            if (colorChipSystem.subType == .rc ||
                colorChipSystem.subType == .rcuv ||
                colorChipSystem.subType == .sl) {
                
                UPCCoatBuild(upcCoat: colorChipSystem.baseCoat as! UPCCoat, viewColor: colorChipSystem.viewColor)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    
                    UPCCoatBuild(upcCoat: colorChipSystem.primeCoat as! UPCCoat, viewColor: colorChipSystem.viewColor)
                    
                }
                
            } else if (colorChipSystem.subType == .ts) {
                
                TSCoatBuild(tsCoat: colorChipSystem.baseCoat as! TSCoat, viewColor: colorChipSystem.viewColor)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    
                    TSCoatBuild(tsCoat: colorChipSystem.primeCoat as! TSCoat, viewColor: colorChipSystem.viewColor)
                    
                }
                if ((colorChipSystem.mvrCoat) != nil) {
                    
                    TSCoatBuild(tsCoat: colorChipSystem.mvrCoat as! TSCoat, viewColor: colorChipSystem.viewColor)
                    
                }
                
            } else if (colorChipSystem.subType == .pa){
                
                PACoatBuild(paCoat: colorChipSystem.baseCoat as! PACoat, viewColor: colorChipSystem.viewColor)
                
                if ((colorChipSystem.primeCoat) != nil) {
                    
                    PACoatBuild(paCoat: colorChipSystem.baseCoat as! PACoat, viewColor: colorChipSystem.viewColor)
                    
                }
                if ((colorChipSystem.mvrCoat) != nil) {
                    
                    TSCoatBuild(tsCoat: colorChipSystem.mvrCoat as! TSCoat, viewColor: colorChipSystem.viewColor)
                    
                }
            }
            
            PACoatBuild(paCoat: colorChipSystem.topCoat1, viewColor: colorChipSystem.viewColor)
            
            if (colorChipSystem.topCoat2 != nil) {
                switch colorChipSystem.topCoat2SubType {
                case .polyaspartic:
                    PACoatBuild(paCoat: colorChipSystem.topCoat2 as! PACoat, viewColor: colorChipSystem.viewColor)
                case .polyurethane:
                    PUCoatBuild(puCoat: colorChipSystem.topCoat2 as! PUCoat, viewColor: colorChipSystem.viewColor)
                }
            }
        }
    }
}





struct ColorChipBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipBuildSuite(colorChipSystem: mockSystem)
    }
}
