//
//  CircleView.swift
//  CamraDive Watch App
//
// Created by Elsavira T on 25/04/24.


import SwiftUI

struct CircleView: View {

    @State private var counter:Float = 0
    @State var isOn = true
    @State private var isHeartAnimating: Bool = false
    @State private var isPressed = false
    var countTo: Float = 1
    
    var body: some View {
    
        ZStack {
            Button(action: {
                self.isPressed.toggle()
            }) {
                Image(systemName: "book")
            }
                    .font(.system(size: 30))
                    .foregroundColor(isPressed ? .blue : .gray)
                    .position(x: 30, y: -10)
            
            Button(action: {
                self.isPressed.toggle()
            }) {
                Image(systemName: "heart.text.square.fill")
            }
                .font(.system(size: 30))
                .foregroundColor(isPressed ? .gray : .blue)
                .position(x: 170, y: -10)
            
            VStack{
                Circle().trim(from: 0, to:CGFloat(counter))
                    .stroke(
                        Color(red: 0, green: 0.75, blue: 1),
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .square,
                            lineJoin: .round
                        ))
                    .frame(width: 140, height: 140)
                    .rotationEffect(.degrees(-90))
                    .shadow(color: .blue.opacity(0.6), radius: 12)
                    .animation(
                        
                        Animation.linear.speed(0.1),
                        value: counter
                        
                    )
                    .overlay(content: {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 80))
                            .symbolEffect(.bounce, options: .speed(0.01), value: isHeartAnimating)
                            .foregroundColor(.red).opacity(0.5)

                    })
                
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.98, green: 0.98, blue: 0.95))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.61, repeats: true) { _ in
                    isHeartAnimating.toggle()
                    isOn = true
                        counter += 0.01
                }
            
            }
    }
}

#Preview {
    CircleView()
}
