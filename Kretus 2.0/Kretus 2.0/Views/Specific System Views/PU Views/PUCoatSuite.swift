//
//  PUCoatSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct PUCoatSuite: View {
    
    @ObservedObject var puCoat: PUCoat
    
    var body: some View {
        VStack {
            Text("\(puCoat.coatType)")
                .font(.title)
            Text("Polyurethane")
                .font(.title2)
            HStack {
                Text("Part A")
                    .font(.headline)
                
                Spacer()
                
                Picker(selection: $puCoat.subType, label: Text("")) {
                    ForEach(PUCoat.SubType.allCases, id: \.self) { subType in
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
            
            if (puCoat.subType == .polyHS) {
                HStack {
                    Text("Part B (Speed)")
                        .font(.headline)
                    
                    Spacer()
                    
                    Picker(selection: $puCoat.speed, label: Text("")) {
                        ForEach(PUCoat.Speed.allCases, id: \.self) { speed in
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
            
            if (puCoat.coatType == .top2)
            {
                HStack {
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Picker(selection: $puCoat.texture, label: Text("")) {
                        ForEach(PUCoat.Texture.allCases.prefix(7), id: \.self) { speed in
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
            
            if (puCoat.coatType == .top)
            {
                HStack {
                    Text("Texture")
                        .font(.headline)
                    
                    Spacer()
                    
                    Picker(selection: $puCoat.texture, label: Text("")) {
                        ForEach(PUCoat.Texture.allCases, id: \.self) { speed in
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
            
            CoatWasteFactorOptions(coat: puCoat)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
}





struct PUCoatSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = PUCoat()

        // Pass the mock System instance into SystemBuilderView
        PUCoatSuite(puCoat: mockCoat)
    }
}
