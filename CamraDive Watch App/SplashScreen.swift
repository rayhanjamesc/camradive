//
//  SplashScreen.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var logo: String = "Logo2"
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        ZStack {
            Image("splashscreen backround")
            
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .onAppear {
                    self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/30abc9e7-5511-4bfd-8e4c-9d898514b227/Hge4AklgRD.json")!)
//                    self.viewModel.loadAnimationFromFile(filename: logo)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
