//
//  PACoatBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct PACoatBuild: View {
    
    @ObservedObject var paCoat: PACoat
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("\(paCoat.coatType)")
                .font(.title)
            Text("\(paCoat.name)")
                .font(.title3)
            Text("Coverage Rate: \(paCoat.covRate)")
            Text("Thickness: \(paCoat.thickness)")
            Text("Colorant: \(paCoat.coatColorant)")
            if (paCoat.texture != .noTexture) {
                Text("Texture: \(paCoat.texture)")
            }
            
            Text("\nKits Needed:")
            KitsListView(kits: paCoat.kitsNeeded)
            Text("Kits from waste factor: \(paCoat.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}





struct PACoatBuild_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = PACoat()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockCoat.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return PACoatBuild(paCoat: mockCoat, viewColor: "Black")
    }
}
