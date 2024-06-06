//
//  PACoatSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct PACoatSuite: View {
    
    @ObservedObject var paCoat: PACoat
    
    var body: some View {
        VStack {
            Text("\(paCoat.coatType)")
                .font(.title)
            Text("Polyaspartic")
                .font(.title2)
            HStack {
                Text("Part A")
                    .font(.headline)
                
                Spacer()
                
                Picker(selection: $paCoat.subType, label: Text("")) {
                    ForEach(PACoat.SubType.allCases, id: \.self) { subType in
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
                Text("Part B (Speed)")
                    .font(.headline)
                
                Spacer()
                
                Picker(selection: $paCoat.speed, label: Text("")) {
                    ForEach(PACoat.Speed.allCases, id: \.self) { speed in
                        Text(speed.description).tag(speed)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.gray).opacity(0.25))
                )
            if (paCoat.coatType != .top1 && paCoat.coatType != .top2) {
                PAColorPicker(paCoat: paCoat)
            }
            
            if (paCoat.coatType == .top2) {
                HStack {
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Picker(selection: $paCoat.texture, label: Text("")) {
                        ForEach(PACoat.Texture.allCases.prefix(7), id: \.self) { speed in
                            Text(speed.description).tag(speed)
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
            
            if (paCoat.coatType == .top) {
                HStack {
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Picker(selection: $paCoat.texture, label: Text("")) {
                        ForEach(PACoat.Texture.allCases, id: \.self) { speed in
                            Text(speed.description).tag(speed)
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
            
            CoatWasteFactorOptions(coat: paCoat)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
}





struct PACoatSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = PACoat()

        // Pass the mock System instance into SystemBuilderView
        PACoatSuite(paCoat: mockCoat)
    }
}
