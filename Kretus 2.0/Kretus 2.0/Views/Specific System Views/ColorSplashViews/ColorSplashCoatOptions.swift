//
//  ColorSplashCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/28/24.
//

import Foundation
import SwiftUI

struct ColorSplashCoatOptions: View {
    
    @ObservedObject var colorSplashSystem: ColorSplashSystem
    
    var body: some View {
        VStack {
            HStack {
                Text("Coat 1 Type")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $colorSplashSystem.selectedSubType1, label: Text("")) {
                    ForEach(ColorSplashSystem.SubTypeBase.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
            )
            HStack {
                Toggle(isOn: $colorSplashSystem.solventCleaner) {
                    Text("Solvent Cleaner")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
                )
            HStack {
                Text("Coat 2 Type")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $colorSplashSystem.selectedSubType2, label: Text("")) {
                    ForEach(ColorSplashSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
            )
            HStack {
                Toggle(isOn: $colorSplashSystem.mattingAdditive2) {
                    Text("Coat 2 Matting Additive")
                }
            }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
            )
            HStack {
                Text("Coat 3 Type")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $colorSplashSystem.selectedSubType3, label: Text("")) {
                    ForEach(ColorSplashSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
            )
                HStack {
                    Toggle(isOn: $colorSplashSystem.mattingAdditive3) {
                        Text("Coat 3 Matting Additive")
                    }
                }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(colorSplashSystem.viewColor).opacity(0.25))
        )
    }
}





struct ColorSplashCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorSplashSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorSplashCoatOptions(colorSplashSystem: mockSystem)
    }
}
