//
//  ESDCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ESDCoatOptions: View {
    
    @ObservedObject var esdSystem: ESDSystem
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Sub Type")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Picker(selection: $esdSystem.subType, label: Text("")) {
                    ForEach(ESDSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description)
                            .tag(subType)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(esdSystem.viewColor).opacity(0.25))
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(esdSystem.viewColor).opacity(0.25))
        )
    }
    
}
struct ESDCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ESDSystem()
        
        ESDCoatOptions(esdSystem: mockSystem)
    }
}

/*
 struct ESDCoatOptions: View {
     
     @ObservedObject var esdSystem: ESDSystem
     
     var body: some View {
         
         Text("Template")
         
     }
     
 }
 struct ESDCoatOptions_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = ESDSystem()
         
         ESDCoatOptions(esdSystem: mockSystem)
     }
 }
 */
