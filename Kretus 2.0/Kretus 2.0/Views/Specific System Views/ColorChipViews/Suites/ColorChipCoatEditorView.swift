//
//  ColorChipCoatEditorView.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 5/21/24.
//

import Foundation
import SwiftUI

struct ColorChipCoatEditorView: View {
  
  @ObservedObject var colorChipSystem: ColorChipSystem
  
  var body: some View {
      Text("\(colorChipSystem.printSystemTest())")
  }
}

struct ColorChipCoatEditorView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock System instance
        let mockSystem = ColorChipSystem()

        // Pass the mock System instance into SystemBuilderView
        ColorChipCoatEditorView(colorChipSystem: mockSystem)
    }
}
