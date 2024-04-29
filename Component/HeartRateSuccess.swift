//
//  HeartRateSuccess.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI

struct HeartRateSuccess: View {
    @State private var isCheckmarkAnimating: Bool = false
    
    var body: some View {
        ZStack {
            
            Image("heartIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 74)
            
            Text("80")
                .font(.title)
                .fontWeight(.medium)
            
            ZStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36)
                    .foregroundColor(.blue)
                    .padding(.top, 50)
                    .padding(.leading, 48)
                    .symbolEffect(.bounce, options: .speed(1).repeat(3), value: isCheckmarkAnimating)
            }
        }
    }
}

#Preview {
    HeartRateSuccess()
}
