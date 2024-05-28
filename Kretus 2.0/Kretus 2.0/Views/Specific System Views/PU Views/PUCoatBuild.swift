//
//  PUCoatBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct PUCoatBuild: View {
    
    @ObservedObject var puCoat: PUCoat
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("\(puCoat.coatType)")
                .font(.title)
            Text("\(puCoat.name)")
                .font(.title3)
            Text("Coverage Rate: \(puCoat.covRate)")
            Text("Thickness: \(puCoat.thickness)")
            if (puCoat.texture != .noTexture) {
                Text("Texture: \(puCoat.texture)")
            }
            Text("\nKits Needed:")
            KitsListView(kits: puCoat.kitsNeeded)
            Text("Kits from waste factor: \(puCoat.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}





struct PUCoatBuild_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = PUCoat()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockCoat.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return PUCoatBuild(puCoat: mockCoat, viewColor: "Black")
    }
}
