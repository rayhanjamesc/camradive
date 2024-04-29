//
//  HeartRateCheckAnimation.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct HeartRateCheckAnimation: View {
    @State var pulsAnimation: String = "Puls Animation"
    @ObservedObject var viewModel: LottieViewModel = .init()
    @State private var animationAmount = 1.0
    @State private var isHeartAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 0.98, green: 0.98, blue: 0.95).ignoresSafeArea()
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .imageScale(.large)
                .foregroundStyle(
                    RadialGradient(
                        gradient: Gradient(colors: [Color(red: 0.6, green: 0.14, blue: 0.11).opacity(1), Color(red: 1, green: 0.27, blue: 0.23).opacity(1)]),
                        center: .center,
                        startRadius: 10,
                        endRadius: 25
                        )
                    .opacity(0.32))
                .scaleEffect(animationAmount)
                .animation(
                    .linear(duration: 6)
                    .repeatForever(autoreverses: true),
                    value: animationAmount
                )
                .onAppear {
                    animationAmount = 2
                }
            
            Image("heartIcon")
                .symbolEffect(.bounce, options: .speed(10), value: isHeartAnimating)
            
                Image(uiImage: viewModel.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65)
                    .padding(.top, 32)
                    .onAppear {
                        self.viewModel.loadAnimationFromFile(filename: pulsAnimation)
                }
            Text("80")
                .font(.headline)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    HeartRateCheckAnimation()
}
