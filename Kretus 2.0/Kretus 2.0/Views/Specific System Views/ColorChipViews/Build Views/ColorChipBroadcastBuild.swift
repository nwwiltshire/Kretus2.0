//
//  ColorChipBroadcastBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation
import SwiftUI

struct ColorChipBroadcastBuild: View {
    
    @ObservedObject var broadCast: ColorChipBroadcast
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("Broadcast")
                .font(.title)
            Text("\(broadCast.name)")
                .font(.title3)
            Text("Coverage Rate: \(broadCast.covRate)")
            Text("Thickness: \(broadCast.thickness)")
            Text("\nKits Needed:")
            KitsListView(kits: broadCast.kitsNeeded)
            Text("Kits from waste factor: \(broadCast.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}





struct ColorChipBroadcastBuild_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockBroadcast = ColorChipBroadcast()
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]
        
        
        mockBroadcast.kitsNeeded = testKits

        // Pass the mock System instance into SystemBuilderView
        return ColorChipBroadcastBuild(broadCast: mockBroadcast, viewColor: "Black")
    }
}
