//
//  HeartRatePassPage.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct HeartRatePassPage: View {
    var heartRateLive: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.98, green: 0.98, blue: 0.95).ignoresSafeArea()
                
                VStack {
                    HStack(spacing: 58) {
                        NavigationLink(destination: Onboarding() .navigationBarBackButtonHidden(true)){
                            Image(systemName: "book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32)
                                .foregroundColor(.gray)
                                .padding(.leading)
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
                    Spacer()
                    HeartRateSuccess(heartRateLive: heartRateLive)
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            //insert action
                        }) {
                            HStack {
                                NavigationLink(destination: HeartRateCheckerPage() .navigationBarBackButtonHidden(true)){
                                    Image(systemName: "arrow.counterclockwise")
                                }
                                
                            }
                            .buttonStyle(.plain)
                            .font(.title)
                            .foregroundColor(.gray)
                        }
                        
                        Button(action: {
                            //insert action
                        }) {
                            HStack {
                                NavigationLink(destination: MainView() .navigationBarBackButtonHidden(true)) {
                                    Image(systemName: "play.fill")
                                }
                            }
                            .buttonStyle(.plain)
                            .font(.title)
                            .foregroundColor(Color(red: 0, green: 0.75, blue: 1))
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

//#Preview {
//    HeartRatePassPage()
//}
