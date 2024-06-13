//
//  EpoxyIndustrialSandSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI


 struct EpoxyIndustrialSandSystemSuite: View {
  
     @ObservedObject var epoxyIndustrialSandSystem: EpoxyIndustrialSandSystem

     var body: some View {
         
         ScrollView {
             EpoxyIndustrialSandCoatOptions(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
             EpoxyIndustrialSandSystemCommitButton(epoxyIndustrialSandSystem: epoxyIndustrialSandSystem)
         }
         
     }
 }

 struct EpoxyIndustrialSandSystemSuite_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = EpoxyIndustrialSandSystem()

         EpoxyIndustrialSandSystemSuite(epoxyIndustrialSandSystem: mockSystem)
     }
 }
