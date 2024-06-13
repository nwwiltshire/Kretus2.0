//
//  ColorChipBroadcastBuild.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/24/24.
//

import Foundation
import SwiftUI

struct BroadcastBuild: View {
    
    @ObservedObject var broadcast: Broadcast
    
    var viewColor: String
    
    var body: some View {
        VStack {
            Text("Broadcast")
                .font(.title)
            Text("\(broadcast.name)")
                .font(.title3)
            Text("Coverage Rate: \(broadcast.covRate)")
            Text("\nKits Needed:")
            KitsListView(kits: broadcast.kitsNeeded)
            Text("Kits from waste factor: \(broadcast.wasteFactor)")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(viewColor).opacity(0.25))
        )
    }
}





struct BroadcastBuild_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockBroadcast = ColorChipBroadcast()

        // Pass the mock System instance into SystemBuilderView
        return BroadcastBuild(broadcast: mockBroadcast, viewColor: "Black")
    }
}
