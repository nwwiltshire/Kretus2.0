//
//  UPCBuildSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 3/15/24.
//

import Foundation
import SwiftUI

struct UPCBuildSuite: View {
    
    @ObservedObject var upcSystem: UPCSystem
    
    var body: some View {
        VStack {
            Text("\(upcSystem.name)")
                .font(.title)
                .padding()
            VStack {
                Text("System\n")
                    .font(.title3)
                Text("Square Feet: \(upcSystem.squareFt)")
                Text("System Color: \(upcSystem.systemColor)")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.gray).opacity(0.25))
            )
            
            VStack {
                Text("Base Coat\n")
                    .font(.title3)
                Text("Kits Needed: \(upcSystem.baseCoat.kitsNeeded)")
                Text("Coverage Rate: \(upcSystem.baseCoat.covRate)")
                Text("Thickness: \(upcSystem.baseCoat.thickness)")
                Text("Part A: \(upcSystem.baseCoat.partA)")
                Text("Part B: \(upcSystem.baseCoat.partB)")
                Text("Part C: \(upcSystem.baseCoat.partC)")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.gray).opacity(0.25))
            )
            
            VStack {
                Text("Prime Coat\n")
                    .font(.title3)
                Text("Kits Needed: \(upcSystem.primeCoat?.kitsNeeded ?? [])")
                Text("Coverage Rate: \(upcSystem.primeCoat?.covRate ?? 0)")
                Text("Thickness: \(upcSystem.primeCoat?.thickness ?? .thinRC)")
                Text("Part A: \(upcSystem.primeCoat?.partA ?? Product())")
                Text("Part B: \(upcSystem.primeCoat?.partB ?? Product())")
                Text("Part C: \(upcSystem.primeCoat?.partC ?? Product())")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.gray).opacity(0.25))
            )
            
            VStack {
                Text("Top Coat\n")
                    .font(.title3)
                Text("Kits Needed: \(upcSystem.topCoat?.kitsNeeded ?? [])")
                Text("Coverage Rate: \(upcSystem.topCoat?.covRate ?? 0)")
                Text("Thickness: \(upcSystem.topCoat?.thickness ?? .thinRC)")
                Text("Part A: \(upcSystem.topCoat?.partA ?? Product())")
                Text("Part B: \(upcSystem.topCoat?.partB ?? Product())")
                Text("Part C: \(upcSystem.topCoat?.partC ?? Product())")
                Text("Texture 1: \(upcSystem.topCoat?.texture1 ?? .none)")
                Text("Texture 2: \(upcSystem.topCoat?.texture2 ?? .none)")
                Text("UV Resistance: \(upcSystem.uvResistance)")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.gray).opacity(0.25))
            )
        }
    }
    
}





struct UPCBuildSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem()

        // Pass the mock System instance into SystemBuilderView
        UPCBuildSuite(upcSystem: mockSystem)
    }
}

