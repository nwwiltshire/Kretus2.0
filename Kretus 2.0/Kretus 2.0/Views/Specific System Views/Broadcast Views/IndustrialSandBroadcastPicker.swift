//
//  IndustrialSandBroadcastPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/7/24.
//

import Foundation
import SwiftUI

struct IndustrialSandBroadcastPicker: View {
    
    @ObservedObject var industrialSandBroadcast: IndustrialSandBroadcast
    
    var body: some View {
        VStack {
            HStack {
                Text("Broadcast")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $industrialSandBroadcast.sand, label: Text("")) {
                    ForEach(IndustrialSandBroadcast.Sand.allCases.suffix(3), id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(EpoxyIndustrialSandSystem().viewColor).opacity(0.25))
            )
            
            BroadcastWasteFactorOptions(broadCast: industrialSandBroadcast, viewColor: EpoxyIndustrialSandSystem().viewColor)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(EpoxyIndustrialSandSystem().viewColor).opacity(0.25))
        )
    }
}





struct IndustrialSandBroadcastPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockBroadcast = IndustrialSandBroadcast()

        // Pass the mock System instance into SystemBuilderView
        IndustrialSandBroadcastPicker(industrialSandBroadcast: mockBroadcast)
    }
}
