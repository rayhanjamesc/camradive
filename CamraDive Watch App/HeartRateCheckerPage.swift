//
//  HeartRateCheckerPage.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct HeartRateCheckerPage: View {
    @State var breathAnimation: String = "Breath animation2"
    @ObservedObject var viewModel: LottieViewModel = .init()
    @State private var navigateToNextPage = false // State variable to control navigation
    @State private var counter:Float = 0
    @State private var isHeartAnimating: Bool = false
    @State var isOn = true
    @State var heartRateLive: Int = 0
    @State var storedHeartRate: Int = 0
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.98, green: 0.98, blue: 0.95).ignoresSafeArea()
                
                VStack {
                    HStack { NavigationLink(destination: Onboarding() .navigationBarBackButtonHidden(true)){
                        Image(systemName: "book")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32)
                            .foregroundColor(.gray)
                        //                            .padding(.trailing)
                        Spacer()
                    }
                        
                        //                        Image(systemName: "heart.text.square.fill")
                        //                            .resizable()
                        //                            .scaledToFit()
                        //                            .frame(width: 32)
                        //                            .foregroundColor(Color(red: 0, green: 0.75, blue: 1))
                        //                            .padding(.trailing)
                    }
                    .padding(.top, 24)
                    HeartRateCheckAnimation(heartRateLive: $heartRateLive)
                        .padding(.top, 24)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36)
                            .padding(.trailing, 10)
                            .onAppear {
                                self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/8b861148-c2b0-45af-9be7-2bda74f71be7/iVwU3X4qlf.json")!)
                            }

                    }
                    .padding(.bottom, 24)
                }
                .ignoresSafeArea()
                .background(
                    NavigationLink(destination: HeartRatePassPage(heartRateLive: storedHeartRate).navigationBarBackButtonHidden(true), isActive: $navigateToNextPage) {
                        EmptyView()
                    }
                )
                
                VStack{
                    Circle().trim(from: 0, to:CGFloat(counter))
                        .stroke(
                            Color(red: 0, green: 0.75, blue: 1),
                            style: StrokeStyle(
                                lineWidth: 10,
                                lineCap: .square,
                                lineJoin: .round
                            ))
                        .frame(width: 120, height: 120)
                        .rotationEffect(.degrees(-90))
                        .shadow(color: .blue.opacity(0.6), radius: 12)
                        .animation(
                            
                            Animation.linear.speed(0.1),
                            value: counter
                            
                        )
                    
                    
                    
                }
            }
            .onAppear{
                startTimer()
                
                Timer.scheduledTimer(withTimeInterval: 0.61, repeats: true) { _ in
                    isHeartAnimating.toggle()
                    isOn = true
                    counter += 0.01
                }
            }
            .onDisappear{
                storedHeartRate = heartRateLive
            }
        }
    }
    
    func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            navigateToNextPage = true
        }
    }
}

#Preview {
    HeartRateCheckerPage()
}
