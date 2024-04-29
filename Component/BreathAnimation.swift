//
//  BreathAnimation.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct BreathAnimation: View {
    @State var breathAnimation: String = "Breath animation"
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        ZStack {
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 36)
                .onAppear {
                    self.viewModel.loadAnimationFromFile(filename: breathAnimation)
            }
        }
    }
}

#Preview {
    BreathAnimation()
}
