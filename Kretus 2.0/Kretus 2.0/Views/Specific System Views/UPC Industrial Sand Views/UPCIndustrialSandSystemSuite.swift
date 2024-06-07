//
//  UPCIndustrialSandSystemSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI


 struct UPCIndustrialSandSystemSuite: View {
  
     @ObservedObject var upcIndustrialSandSystem: UPCIndustrialSandSystem

     var body: some View {
         
         ScrollView {
             UPCIndustrialSandCoatOptions(upcIndustrialSandSystem: upcIndustrialSandSystem)
             UPCIndustrialSandSystemCommitButton(upcIndustrialSandSystem: upcIndustrialSandSystem)
         }
         
     }
 }

 struct UPCIndustrialSandSystemSuite_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = UPCIndustrialSandSystem()

         UPCIndustrialSandSystemSuite(upcIndustrialSandSystem: mockSystem)
     }
 }
