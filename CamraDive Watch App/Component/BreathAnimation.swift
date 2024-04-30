//
//  BreathAnimation.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct BreathAnimation: View {
    @State var breathAnimation: String = "Breath animation2"
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        ZStack {
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 36)
                .onAppear {
                    self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/8b861148-c2b0-45af-9be7-2bda74f71be7/iVwU3X4qlf.json")!)
//                    self.viewModel.loadAnimationFromFile(filename: breathAnimation)
            }
        }
    }
}

#Preview {
    BreathAnimation()
}
