//
//  HeartbeatAnimation.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 30/04/24.
//

import SwiftUI

struct HeartbeatAnimation: View {
    @State var pulsAnimation: String = "Puls Animation2"
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        Image(uiImage: viewModel.image)
            .resizable()
            .scaledToFit()
            .frame(width: 65)
            .padding(.top, 32)
            .onAppear {
                self.viewModel.loadAnimationFromFile(filename: pulsAnimation)
        }
    }
}

#Preview {
    HeartbeatAnimation()
}
