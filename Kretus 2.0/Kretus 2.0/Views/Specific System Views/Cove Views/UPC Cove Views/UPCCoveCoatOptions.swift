//
//  UPCCoveCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct UPCCoveCoatOptions: View {
    
    @ObservedObject var upcCoveSystem: UPCCoveSystem
    
    var body: some View {
        VStack {
            VStack {
                Text("Coat Height")
                Picker(selection: $upcCoveSystem.height, label: Text("")) {
                    ForEach(UPCCoveSystem.Height.allCases.suffix(2), id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(upcCoveSystem.viewColor).opacity(0.25))
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(upcCoveSystem.viewColor).opacity(0.25))
        )
    }
}

struct UPCCoveCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = UPCCoveSystem()
        
        UPCCoveCoatOptions(upcCoveSystem: mockSystem)
    }
}
