//
//  TSCoatSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/22/24.
//

import Foundation
import SwiftUI

struct TSCoatSuite: View {
    
    @ObservedObject var tsCoat: TSCoat
    
    var body: some View {
        VStack {
            Text("\(tsCoat.coatType)")
                .font(.title)
            Text("Top Shelf Epoxy")
                .font(.title2)
            if (tsCoat.selectedPartA != .coveResin) {
            HStack {
                Text("Part A")
                    .font(.headline)
                
                Spacer()
                
                Picker(selection: $tsCoat.selectedPartA, label: Text("")) {
                    ForEach(TSCoat.PartAs.allCases.prefix(20), id: \.self) { partA in
                        Text(partA.description).tag(partA)
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
            HStack {
                Text("Part B (Speed)")
                    .font(.headline)
                
                Spacer()
                
                Picker(selection: $tsCoat.speed, label: Text("")) {
                    ForEach(TSCoat.Speed.allCases, id: \.self) { speed in
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
            
            TSColorPicker(tsCoat: tsCoat)
            
            CoatWasteFactorOptions(coat: tsCoat)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
}





struct TSCoatSuite_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = TSCoat()

        // Pass the mock System instance into SystemBuilderView
        TSCoatSuite(tsCoat: mockCoat)
    }
}
