//
//  SplashScreen.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var logo: String = "Logo"
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        ZStack {
            Image("splashscreen backround")
            
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .onAppear {
                    self.viewModel.loadAnimationFromFile(filename: logo)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
