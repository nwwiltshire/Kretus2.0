//
//  PAColorPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct PAColorPicker: View {
    
    @ObservedObject var paCoat: PACoat
    
    @State private var paSelectedColor: PACoat.CoatColorant = .noColor
    
    @State private var isExpanded = false
    
    let layout = [
        
            GridItem(.flexible()),
            GridItem(.flexible())
            
        ]
    
    var body: some View {
        VStack {
            DisclosureGroup("Choose Coat Colorant", isExpanded: $isExpanded) {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(PACoat.CoatColorant.allCases, id: \.self) { paColor in
                        Button(action: {
                            self.paSelectedColor = paColor
                            paCoat.coatColorant = paSelectedColor
                            withAnimation(.easeInOut(duration: 0.5)) {
                                        isExpanded.toggle()
                                      }
                        }) {
                            VStack {
                                
                                Circle()
                                    .fill(Color(paColor.description))
                                    .frame(width: 50, height: 50)
                                    .shadow(color: .default.opacity(1), radius: 2, x: 0, y: 0)
                                    .overlay(Circle().stroke(self.paCheckmarkColor(for: paColor), lineWidth: paSelectedColor == paColor ? 2 : 0))
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(self.paCheckmarkColor(for: paColor))
                                            .opacity(paSelectedColor == paColor ? 1 : 0)
                                    )
                                Text(paColor.description)
                            }
                        }
                    }
                }
            }
            
            VStack {
                Circle()
                    .fill(Color(paSelectedColor.description))
                    .frame(width: 25, height: 25)
                    .shadow(color: .default.opacity(1), radius: 2, x: 0, y: 0)
                
                Text(paSelectedColor.description)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
    
    
    func paCheckmarkColor(for color: PACoat.CoatColorant) -> Color {
        // Convert the SwiftUI color to a UIColor
        let uiColor = UIColor(Color(color.description))
        
        var white: CGFloat = 0
        uiColor.getWhite(&white, alpha: nil)
        
        // If the color is dark (i.e., ipa brightness is less than 0.5), return white. Otherwise, return black.
        return white < 0.5 ? .white : .black
    }
}



struct PAColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = PACoat()

        // Pass the mock System instance into SystemBuilderView
        PAColorPicker(paCoat: mockCoat)
    }
}
