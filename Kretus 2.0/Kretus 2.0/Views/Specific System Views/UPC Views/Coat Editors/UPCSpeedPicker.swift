//
//  UPCSpeedPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/19/24.
//

import Foundation
import SwiftUI

struct UPCSpeedPicker: View {
    
    @ObservedObject var coat: UPCCoat
    
    var body: some View {
        HStack {
            Text("Speed")
                .font(.headline)
                .padding()
            
            Spacer()
            
            Picker(selection: $coat.speed, label: Text("")) {
                ForEach(UPCCoat.Speed.allCases, id: \.self) { subType in
                    Text(subType.description).tag(subType)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
            )
    }
}





struct UPCSpeedPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCCoat()

        // Pass the mock System instance into SystemBuilderView
        UPCSpeedPicker(coat: mockSystem)
    }
}

