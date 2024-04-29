//
//  HeartRateFailed.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct HeartRateFailed: View {
    var body: some View {
        ZStack {
            Image("heartIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 74)
            
            Text("50")
                .font(.title)
                .fontWeight(.medium)
            
            ZStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36)
                    .foregroundColor(.yellow)
                    .padding(.top, 50)
                    .padding(.leading, 48)
            }
        }
    }
}

#Preview {
    HeartRateFailed()
}
