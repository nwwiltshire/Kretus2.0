//
//  EpoxyCoveCoatOptions.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/30/24.
//

import Foundation
import SwiftUI

struct EpoxyCoveCoatOptions: View {
    
    @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
    
    var body: some View {
        VStack {
            VStack {
                Text("Coat Height")
                Picker(selection: $epoxyCoveSystem.height, label: Text("")) {
                    ForEach(EpoxyCoveSystem.Height.allCases.suffix(2), id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyCoveSystem.viewColor).opacity(0.25))
            )
            HStack {
                Text("Sub System")
                Spacer()
                Picker(selection: $epoxyCoveSystem.subType, label: Text("")) {
                    ForEach(EpoxyCoveSystem.SubType.allCases, id: \.self) { subType in
                        Text(subType.description).tag(subType)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(epoxyCoveSystem.viewColor).opacity(0.25))
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(epoxyCoveSystem.viewColor).opacity(0.25))
        )
    }
}

struct EpoxyCoveCoatOptions_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = EpoxyCoveSystem()
        
        EpoxyCoveCoatOptions(epoxyCoveSystem: mockSystem)
    }
}

/*
 import SwiftUI

 struct EpoxyCove: View {
     
     @ObservedObject var epoxyCoveSystem: EpoxyCoveSystem
     
     var body: some View {
         /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
     }
 }

 struct EpoxyCove_Previews: PreviewProvider {
     static var previews: some View {
         let mockSystem = EpoxyCoveSystem()
         
         EpoxyCove(epoxyCoveSystem: mockSystem)
     }
 }
 */
