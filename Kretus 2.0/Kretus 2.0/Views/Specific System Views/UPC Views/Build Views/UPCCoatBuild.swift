//
//  UPCBaseCoatBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI

struct UPCCoatBuild: View {
    
    @ObservedObject var upcCoat: UPCCoat
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("\(upcCoat.coatType)")
                .font(.title)
            Text("\(upcCoat.name)")
                .font(.title3)
            Text("Coverage Rate: \(upcCoat.covRate)")
            Text("Thickness: \(upcCoat.thickness)")
            if (upcCoat.texture1 != .none) {
                Text("Texture: \(upcCoat.texture1)")
            }
            if (upcCoat.texture2 != .none) {
                Text("Texture: \(upcCoat.texture2)")
            }
            Text("\nKits Needed:")
            KitsListView(kits: upcCoat.kitsNeeded)
            Text("Kits from waste factor: \(upcCoat.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}





struct UPCCoatBuild_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockCoat = UPCCoat()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockCoat.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return UPCCoatBuild(upcCoat: mockCoat, viewColor: "Black")
    }
}
