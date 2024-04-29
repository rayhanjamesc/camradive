//
//  HeartRateRetry.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct HeartRateRetry: View {
    var body: some View {
        ZStack {
            Color(red: 0.98, green: 0.98, blue: 0.95).ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                        .foregroundColor(Color(red: 0, green: 0.75, blue: 1))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "heart.text.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32)
                        .foregroundColor(Color(red: 0, green: 0.75, blue: 1))
                        .padding(.trailing)
                }
                .padding(.top, 24)
                Spacer()
                HeartRateFailed()
                
                Button(action: {
                    //insert action
                }) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                    }
                    .buttonStyle(.plain)
                    .font(.title)
                    .foregroundColor(Color(red: 0, green: 0.75, blue: 1))
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HeartRateRetry()
}
