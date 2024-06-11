//
//  ConductivePrimerCoatSuite.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 6/11/24.
//

import Foundation
import SwiftUI

struct ConductivePrimerCoatSuite: View {
    
    @ObservedObject var conductivePrimer: ConductivePrimer
    
    var body: some View {
        VStack {
            Text("Conductive Primer")
                .font(.title)
            CoatWasteFactorOptions(coat: conductivePrimer)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.gray).opacity(0.25))
        )
    }
}

struct ConductivePrimerCoatSuite_Previews: PreviewProvider {
    static var previews: some View {
        let mockCoat = ConductivePrimer()
        
        ConductivePrimerCoatSuite(conductivePrimer: mockCoat)
    }
}
