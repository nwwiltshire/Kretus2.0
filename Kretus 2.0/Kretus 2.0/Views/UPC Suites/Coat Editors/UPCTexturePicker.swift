//
//  UPCTexturePicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/19/24.
//

import Foundation
import SwiftUI

struct UPCTexturePicker: View {
    
    @ObservedObject var coat: UPCCoat
    
    var body: some View {
        VStack {
            HStack {
                Text("Texture One:")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $coat.texture1, label: Text("")) {
                    ForEach(UPCSystem.Texture.allCases, id: \.self) { subType in
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
            
            HStack {
                Text("Texture Two:")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $coat.texture2, label: Text("")) {
                    ForEach(UPCSystem.Texture.allCases, id: \.self) { subType in
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
}





struct UPCTexturePicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCCoat()

        // Pass the mock System instance into SystemBuilderView
        UPCTexturePicker(coat: mockSystem)
    }
}
