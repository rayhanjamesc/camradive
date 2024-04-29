//
//  TimeDataView.swift
//  CamraDive Watch App
//  Susah banget cok
//
//  Created by James Cellars on 25/04/24.
//

import SwiftUI
import Charts

struct TimeDataView: View {
    @Binding var stopwatchData: [Double]
    
    var body: some View {
        ScrollView{
            List(stopwatchData, id: \.self) { time in
                Text(String(format: "%.2f", time))
            }
            .frame(height: 200)
            
            
        }
        Text("Nope")
        
        //ADD CLEAR LIST BUTTON IF THERE IS TIME
    }
}

struct TimeDataView_Previews: PreviewProvider {
    @State static var stopwatchData: [Double] = [0.0, 2.1]
    
    static var previews: some View {
        TimeDataView(stopwatchData: $stopwatchData) 
    }
}
