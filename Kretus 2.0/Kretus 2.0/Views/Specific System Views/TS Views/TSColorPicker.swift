//
//  TSColorPicker.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/22/24.
//

import Foundation
import SwiftUI

struct TSColorPicker: View {
    
    @ObservedObject var tsCoat: TSCoat
    
    @State private var tsSelectedColor: TSCoat.CoatColorant = .noColor
    
    @State private var isExpanded = false
    
    let layout = [
        
            GridItem(.flexible()),
            GridItem(.flexible())
            
        ]
    
    var body: some View {
        VStack {
            DisclosureGroup("Choose Coat Colorant", isExpanded: $isExpanded) {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(TSCoat.CoatColorant.allCases.prefix(17), id: \.self) { tsColor in
                        Button(action: {
                            self.tsSelectedColor = tsColor
                            tsCoat.coatColorant = tsSelectedColor
                            withAnimation(.easeInOut(duration: 0.5)) {
                                        isExpanded.toggle()
                                      }
                        }) {
                            VStack {
                                
                                Circle()
                                    .fill(Color(tsColor.description))
                                    .frame(width: 50, height: 50)
                                    .shadow(color: .default.opacity(1), radius: 2, x: 0, y: 0)
                                    .overlay(Circle().stroke(self.tsCheckmarkColor(for: tsColor), lineWidth: tsSelectedColor == tsColor ? 2 : 0))
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(self.tsCheckmarkColor(for: tsColor))
                                            .opacity(tsSelectedColor == tsColor ? 1 : 0)
                                    )
                                Text(tsColor.description)
                            }
                        }
                    }
                }
            }
            
            VStack {
                Circle()
                    .fill(Color(tsSelectedColor.description))
                    .frame(width: 25, height: 25)
                    .shadow(color: .default.opacity(1), radius: 2, x: 0, y: 0)
                
                Text(tsSelectedColor.description)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
    
    
    func tsCheckmarkColor(for color: TSCoat.CoatColorant) -> Color {
        // Convert the SwiftUI color to a UIColor
        let uiColor = UIColor(Color(color.description))
        
        var white: CGFloat = 0
        uiColor.getWhite(&white, alpha: nil)
        
        // If the color is dark (i.e., its brightness is less than 0.5), return white. Otherwise, return black.
        return white < 0.5 ? .white : .black
    }
}



struct TSColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = TSCoat()

        // Pass the mock System instance into SystemBuilderView
        TSColorPicker(tsCoat: mockCoat)
    }
}
