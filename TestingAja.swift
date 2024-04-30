////
////  WaitingPaymentView.swift
////  noQ
////
////  Created by Dinda Ayu Syafitri on 01/04/24.
////
//
//import SwiftUI
//import AVKit
//
//struct WaitingPaymentView: View {
//    @Environment(\.dismiss) var backbutton
//    @State private var hasTimeElapsed = false
//    @State private var timeRe = 5
//    
//    private func delay() async {
//        try? await Task.sleep(nanoseconds: 1_000_000_000)
//        timeRe -= 1
//        if timeRe > 0 {
//           await delay()
//        }else{
//            hasTimeElapsed.toggle()
//        }
//    }
//
//    var body: some View {
//        NavigationStack{
//            VStack {
//
//                ScrollView {
////                    .....
//                }
//                .padding(.horizontal, 20)
//                .padding(.vertical,0)
//                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                .navigationDestination(isPresented: $hasTimeElapsed){
//                    WaitingOrderView()
//                }
//            }.task{
//               await delay()
//            }.navigationBarBackButtonHidden(true)
//        }
//
//    }
//}
//
//#Preview {
//    WaitingPaymentView()
//}
