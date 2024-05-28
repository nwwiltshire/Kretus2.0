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
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockCoat.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return TSCoatBuild(tsCoat: mockCoat, viewColor: "Black")
    }
}
