//
//  PreparationAnimation.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 30/04/24.
//

import SwiftUI

struct PreparationAnimation: View {
    @State private var animationAmount: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 40) {
            Circle()
                .foregroundColor(.red)
                .frame(width: 24)
                .scaleEffect(animationAmount)
                .opacity(animationAmount)
                .animation(
                    .easeInOut(duration: 1.5)
                    /*.repeatForever(autoreverses: false)*/,
                    value: animationAmount
                )
//                .onAppear {
//                    animationAmount = 2
//                }
            
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 24)
                .scaleEffect(animationAmount)
                .opacity(animationAmount)
                .animation(
                    .easeInOut(duration: 1.5)
                    .delay(1)
                    /*.repeatForever(autoreverses: false)*/,
                    value: animationAmount
                )
//                .onAppear {
//                    animationAmount = 2
//                }
            
            Circle()
                .foregroundColor(.green)
                .frame(width: 24)
                .scaleEffect(animationAmount)
                .opacity(animationAmount)
                .animation(
                    .easeInOut(duration: 1.5)
                    .delay(2)
                    /*.repeatForever(autoreverses: false)*/,
                    value: animationAmount
                )
//                .onAppear {
//                    animationAmount = 2
//                }
        }
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    PreparationAnimation()
}
