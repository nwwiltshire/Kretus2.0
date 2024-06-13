//
//  ConductivePrimerCoatBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ConductivePrimerCoatBuild: View {
    
    @ObservedObject var conductivePrimer: ConductivePrimer
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("Conductive Primer")
                .font(.title)
            Text("Coverage Rate: \(conductivePrimer.covRate)")
            
            Text("\nKits Needed:")
            KitsListView(kits: conductivePrimer.kitsNeeded)
            Text("Kits from waste factor: \(conductivePrimer.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}

struct ConductivePrimerCoatBuild_Previews: PreviewProvider {
    static var previews: some View {
        let mockSystem = ConductivePrimer()
        
        ConductivePrimerCoatBuild(conductivePrimer: mockSystem, viewColor: ESDSystem().viewColor)
    }
}
