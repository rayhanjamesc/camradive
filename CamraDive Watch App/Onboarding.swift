//
//  Onboarding.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct Onboarding: View {
    @State var breathAnimation: String = "Breath animation2"
    @State var isClick: Bool = false
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.98, green: 0.98, blue: 0.95).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    HStack {
                        
                        Image(systemName: "book")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 33)
                            .foregroundColor(Color(red: 0, green: 0.75, blue: 1))
                            .padding(.trailing, 8.0)
                    }
                    .padding(.top, 24)
                    Spacer()
                    HStack {
                        Spacer()
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .onAppear {
                                self.viewModel.loadAnimationFromFile(filename: breathAnimation)
                            }
                        
                        Spacer()
                        
                        PulsAnimation()
                            .frame(width: 37, height: 37)
                            .padding()
                        
                        Spacer()
                    }
                    Spacer()
                    //                    Button(action: {
                    //                        //insert action
                    //                    }) {
                    HStack {
                        NavigationLink(destination: HeartRateCheckerPage() .navigationBarBackButtonHidden(true)){
                                Image(systemName: "arrow.right")
                            }
                    }
                    .buttonStyle(.plain)
                    .frame(width: 48, height: 48)
                    .background(Color(red: 0, green: 0.75, blue: 1))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    //                    }
                    Spacer()
                }
                .ignoresSafeArea(/*.container, edges: .bottom*/)
            }
        }
    }
}

#Preview {
    Onboarding()
}