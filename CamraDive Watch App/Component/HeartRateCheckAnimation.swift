//
//  HeartRateCheckAnimation.swift
//  CamraDive
//
//  Created by Gilang Kisaragi on 29/04/24.
//

import SwiftUI
import HealthKit

struct HeartRateCheckAnimation: View {
    @State var pulsAnimation: String = "Puls Animation2"
    @ObservedObject var viewModel: LottieViewModel = .init()
    @State var animationAmount = 1.0
    @State var isHeartAnimating: Bool = false
    
    // HealthKit Heart Rate//
    var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @Binding var heartRateLive: Int
    
    var body: some View {
        ZStack {
//            Color(red: 0.98, green: 0.98, blue: 0.95).ignoresSafeArea()
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .imageScale(.large)
                .foregroundStyle(
                    RadialGradient(
                        gradient: Gradient(colors: [Color(red: 0.6, green: 0.14, blue: 0.11).opacity(1), Color(red: 1, green: 0.27, blue: 0.23).opacity(1)]),
                        center: .center,
                        startRadius: 10,
                        endRadius: 25
                        )
                    .opacity(0.32))
                .scaleEffect(animationAmount)
                .animation(
                    .linear(duration: 6)
                    .repeatForever(autoreverses: true),
                    value: animationAmount
                )
                .onAppear {
                    animationAmount = 2
                }
            
            Image("heartIcon")
                .symbolEffect(.bounce, options: .speed(10), value: isHeartAnimating)
            
            Image("Puls")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .padding(.top, 32)
            
//                Image(uiImage: viewModel.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 65)
//                    .padding(.top, 32)
//                    .onAppear {
//                        self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/ef811593-3910-4c13-829c-b8bbb2cff97c/X1cms4sPM6.json")!)
//                }
            Text("\(heartRateLive)")
                .font(.headline)
                .fontWeight(.regular)
        }
        .onAppear(perform: start)
    }
    
    func start() {
        autorizeHealthKit()
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
    }
    
    func autorizeHealthKit() {
        let healthKitTypes: Set = [
        HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }
    
    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        
        // 1
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        // 2
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
            // 3
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }
            
        self.process(samples, type: quantityTypeIdentifier)

        }
        
        // 4
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        // 5
        
        healthStore.execute(query)
    }
    
    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        
        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }
            
            self.heartRateLive = Int(lastHeartRate)
        }
    }
}

//#Preview {
//    HeartRateCheckAnimation()
//}
