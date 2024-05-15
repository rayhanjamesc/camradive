//
//  ContentView.swift
//  CamraDive Watch App
//
//  Created by James Cellars on 25/04/24.
//

import SwiftUI
import Foundation
import Charts

struct MainView: View {
    @ObservedObject var managerClass = ManagerClass()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack { NavigationLink(destination: Onboarding() .navigationBarBackButtonHidden(true)){
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                        .padding(.trailing, 125)
                    }
                    Spacer()
                }
                
                Group {
                    if managerClass.mode == .highscore {
                        Image(systemName: "crown.fill")
                            .font(Font.custom("SF Pro", size: 34))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 1, green: 0.8, blue: 0))
                            .padding(.bottom, 9)
                        
                        Text(String(format: "%.2f", managerClass.secondElapsed))
                            .font(Font.custom("SF Pro", size: 34))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.black)
                            .padding(.bottom, 16)
                        
                        HStack {
                            NavigationLink(
                                destination: ChartView(managerClass: managerClass),
                                label: {
                                    Image(systemName: "list.bullet.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                                        .padding()
                                        .cornerRadius(20)
                                })
                            Button(action: {
                                managerClass.reset()
                            }, label: {
                                Image(systemName: "gobackward")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 0, green: 0.75, blue: 1))
                                    .cornerRadius(100)
                            })
                        }
                    }
                }
                
                if managerClass.mode != .highscore {
                    Text(String(format: "%.2f", managerClass.secondElapsed))
                        .font(Font.custom("SF Pro", size: 34))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.black)
                        .padding(.bottom, 16)
                }
                
                HStack {
                    Group {
                        if managerClass.mode == .reset {
                            NavigationLink(
                                destination: ChartView(managerClass: managerClass),
                                label: {
                                    Image(systemName: "list.bullet.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                                        .padding()
                                        .cornerRadius(20)
                                })
                        }
                    }
                    
                    //Switching between stopwatch modes
                    switch managerClass.mode {
                    case .stopped:
                        withAnimation {
                            //Button for starting stopwatch
                            Button(action: {
                                managerClass.start()
                            }, label: {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(100)
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                    case .running:
                        withAnimation {
                            Button(action: {
                                managerClass.stop()
                            }, label: {
                                Image(systemName: "stop.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color(red: 1, green: 0.23, blue: 0.19))
                                    .cornerRadius(100)
                            })
                        }
                    case .reset:
                        withAnimation {
                            Button(action: {
                                managerClass.reset()
                            }, label: {
                                Image(systemName: "gobackward")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 0, green: 0.75, blue: 1))
                                    .cornerRadius(100)
                            })
                        }
                    case .highscore:
                        //This is just filler code cause the switch needs an executable
                        let a = "ab"
                    }
                }
            }
        }
        .background(Color(red: 0.98, green: 0.98, blue: 0.95))
    }
}

struct ChartView: View {
    @ObservedObject var managerClass = ManagerClass()
    
    var body: some View {
        Chart {
            ForEach(managerClass.data.indices, id: \.self) { index in
                BarMark(x: .value("Date", index ), y: .value("Time", managerClass.data[index]))
                    .foregroundStyle(Color(red: 0.21, green: 0.72, blue: 0.98))
            }
        }
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

enum mode {
    case running
    case stopped
    case reset
    case highscore
}

//Handles logic related to stopwatch
//REMINDER: DATA IS STILL STORED AS SECONDS INSTEAD OF MINUTES
class ManagerClass:ObservableObject, Equatable {
    static func == (lhs: ManagerClass, rhs: ManagerClass) -> Bool {
            return lhs.secondElapsed == rhs.secondElapsed &&
                lhs.mode == rhs.mode &&
                lhs.stopwatchData == rhs.stopwatchData
        }
    @Published var secondElapsed = 0.0
    @Published var mode:mode = .stopped
    //Array to store past times
    @Published var stopwatchData = [Double]()
    
    struct ChartData: Identifiable {
        let date: String
        let count: Int
        
        var id: String { return date }
    }
    
    var data = [Double]()
    
    //The timer var is equal to Timer() class
    var timer = Timer()
    
    //Function for starting the stopwatch (starts timer using Timer() class
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            //Increments secondElapsed by 0.1 everytime timer is called
            self.secondElapsed += 0.1
        }
        print(mode)
    }
    
    //Function for stopping the stopwatch
    func stop() {
        timer.invalidate()
        let tempSecond = secondElapsed
        stopwatchData.insert(tempSecond, at: 0)
        data.append(tempSecond)
        
        //Check whether latest time is high score or not
        guard let maxTime = stopwatchData.max() else {
            print("No max time yet")
            return
        }
        
        if tempSecond >= maxTime {
            mode = .highscore
        } else {
            mode = .reset
        }
        print(mode)
        print(data)
    }
    
    func reset() {
        secondElapsed = 0
        mode = .stopped
        print(mode)
    }
}

#Preview {
    MainView()
}
