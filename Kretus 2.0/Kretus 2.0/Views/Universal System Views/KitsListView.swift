//
//  KitsListView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/23/24.
//

import Foundation
import SwiftUI


struct KitsListView: View {
    
    var kits: [Kit]
    
    var body: some View {
        VStack {
        HStack {
            Text("Product Code")
                .underline()
            Spacer()
            Text("Name")
                .underline()
            Spacer()
            Text("Quantity")
                .underline()
        }
        ForEach(kits, id: \.id) { kit in
            VStack {
                HStack {
                    Text(kit.product.id)
                        .font(.caption)
                    Spacer()
                    Text(kit.product.name)
                        .font(.caption)
                    Spacer()
                    Text(kit.quantity.description)
                        .font(.caption)
                }
            }
        }
    }
    }
}





struct KitsListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let testKits = [Kit(product: Product(id: "1234", name: "Test 1"), quantity: 1), Kit(product: Product(id: "12345", name: "Test 2"), quantity: 2), Kit(product: Product(id: "123456", name: "Test 3"), quantity: 3)]

        // Pass the mock System instance into SystemBuilderView
        return KitsListView(kits: testKits)
    }
}
