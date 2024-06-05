//
//  TSCoatBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct TSCoatBuild: View {
    
    @ObservedObject var tsCoat: TSCoat
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("\(tsCoat.coatType)")
                .font(.title)
            Text("\(tsCoat.name)")
                .font(.title3)
            Text("Coverage Rate: \(tsCoat.covRate)")
            Text("Thickness: \(tsCoat.thickness)")
            Text("Colorant: \(tsCoat.coatColorant)")
            
            Text("\nKits Needed:")
            KitsListView(kits: tsCoat.kitsNeeded)
            Text("Kits from waste factor: \(tsCoat.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}





struct TSCoatBuild_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = TSCoat()

        // Pass the mock System instance into SystemBuilderView
        return TSCoatBuild(tsCoat: mockCoat, viewColor: "Black")
    }
}
