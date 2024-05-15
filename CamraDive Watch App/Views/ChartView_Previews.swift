//
//  ChartView_Previews.swift
//  CamraDive Watch App
//
//  Created by James Cellars on 28/04/24.
//

import SwiftUI

struct ChartView_Previews: PreviewProvider {
    @StateObject var managerClass = ManagerClass()
    static var previews: some View {
        ChartView(managerClass: ManagerClass())
    }
}
