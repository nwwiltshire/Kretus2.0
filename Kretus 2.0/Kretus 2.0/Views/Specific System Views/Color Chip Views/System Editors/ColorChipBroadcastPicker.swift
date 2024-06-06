//
//  ColorChipBroadcastPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation
import SwiftUI

struct ColorChipBroadcastPicker: View {
    
    @ObservedObject var colorChipBroadcast: ColorChipBroadcast
    
    var body: some View {
        VStack {
            if (colorChipBroadcast.grade == .none) {
                HStack {
                    Text("Broadcast")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                    
                    Picker(selection: $colorChipBroadcast.thickness, label: Text("")) {
                        ForEach(ColorChipBroadcast.Thickness.allCases, id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(ColorChipSystem().viewColor).opacity(0.25))
                )
            } else {
                HStack {
                    Text("Broadcast")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                    
                    Picker(selection: $colorChipBroadcast.grade, label: Text("")) {
                        ForEach(ColorChipBroadcast.Grade.allCases.suffix(3), id: \.self) { subType in
                            Text(subType.description).tag(subType)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(ColorChipSystem().viewColor).opacity(0.25))
                )
            }
            
            BroadcastWasteFactorOptions(broadCast: colorChipBroadcast, viewColor: ColorChipSystem().viewColor)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(ColorChipSystem().viewColor).opacity(0.25))
        )
    }
}





struct ColorChipBroadcastPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockBroadcast = ColorChipBroadcast()

        // Pass the mock System instance into SystemBuilderView
        ColorChipBroadcastPicker(colorChipBroadcast: mockBroadcast)
    }
}
