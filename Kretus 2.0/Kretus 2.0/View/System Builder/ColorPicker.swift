//
//  ColorPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/6/24.
//

import Foundation
import SwiftUI

struct ColorPicker: View {
    
    @ObservedObject var system: System
    
    @State private var selectedColor: System.SystemColor = .unpigmented
    
    let layout = [
        
            GridItem(.flexible()),
            GridItem(.flexible())
            
        ]
    
    var body: some View {
        VStack {
            DisclosureGroup("Choose System Color") {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(system.availableSystemColors, id: \.self) { color in
                        Button(action: {
                            self.selectedColor = color
                            // control goes here
                        }) {
                            VStack {
                                
                                Circle()
                                    .fill(Color(color.description))
                                    .frame(width: 50, height: 50)
                                    .shadow(color: .default.opacity(1), radius: 2, x: 0, y: 0)
                                    .overlay(Circle().stroke(self.checkmarkColor(for: color), lineWidth: selectedColor == color ? 2 : 0))
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(self.checkmarkColor(for: color))
                                            .opacity(selectedColor == color ? 1 : 0)
                                    )
                                
                                Text(color.description)
                            }
                        }
                    }
                }
            }
            
            VStack {
                Circle()
                    .fill(Color(selectedColor.description))
                    .frame(width: 25, height: 25)
                    .shadow(color: .default.opacity(1), radius: 2, x: 0, y: 0)
                
                Text(selectedColor.description)
            }
            .padding()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(system.viewColor).opacity(0.25))
        )
        .padding()
    }
    
    
    func checkmarkColor(for color: System.SystemColor) -> Color {
        // Convert the SwiftUI color to a UIColor
        let uiColor = UIColor(Color(color.description))
        
        var white: CGFloat = 0
        uiColor.getWhite(&white, alpha: nil)
        
        // If the color is dark (i.e., its brightness is less than 0.5), return white. Otherwise, return black.
        return white < 0.5 ? .white : .black
    }
}



struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = UPCSystem(id: 0,
                                   name: "UPC 1-Coat",
                                   description: "Low odor, 100% solids, 3-component system with mix-and-match versatility.",
                                   imageName: "default",
                                   viewColor: "UPC",
                                   availableSubTypes: [.rc, .tt, .sl, .mf],
                                   availableSystemColors: [.unpigmented, .black, .blue, .bone, .brown, .clay, .gray, .green, .mustard, .red],
                                   subType: .none,
                                   systemColor: .unpigmented,
                                   baseCoat: UPCCoat(),
                                   primeCoat: UPCCoat(),
                                   topCoat: UPCCoat(),
                                   squareFt: 0,
                                   totalkitsNeeded: [])

        // Pass the mock System instance into SystemBuilderView
        ColorPicker(system: mockSystem)
    }
}
