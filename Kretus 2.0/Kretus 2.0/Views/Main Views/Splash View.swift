//
//  Splash View.swift
//  Kretus 2.0
//
//  Created by Nick Wiltshire on 2/21/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Image("Kretus Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews:
    
    PreviewProvider {
    static var previews: some View {
        SplashView()
    }
    
}
