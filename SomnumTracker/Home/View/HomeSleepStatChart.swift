//
//  HomeSleepStatChart.swift
//  SomnumTracker
//
//  Created by Toni Lozano Fernández on 5/5/23.
//

import Foundation
import SwiftUI
import Charts

struct HomeSleepStatChart: View {
    
    @State var test = Test()
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // SwiftUI Chart view
    var body: some View {
        Chart(viewModel.sleepStats) { sleepStat in
            AreaMark(
                x: .value("Weekday", CustomDateFormatter.shared.formatDayMonth(sleepStat.createAt)),
                y: .value("Sleep Duration", sleepStat.sleepDuration)
            )
            .foregroundStyle(Color(UIColor.customBlueLight))
            .interpolationMethod(.cardinal)
            LineMark(
                x: .value("Weekday", CustomDateFormatter.shared.formatDayMonth(sleepStat.createAt)),
                y: .value("Sleep Duration", sleepStat.sleepDuration)
            )
            .foregroundStyle(Color(UIColor.customBlue))
            .interpolationMethod(.cardinal)
            PointMark(
                x: .value("Weekday", CustomDateFormatter.shared.formatDayMonth(sleepStat.createAt)),
                y: .value("Sleep Duration", sleepStat.sleepDuration)
            )
            .foregroundStyle(Color(UIColor.customBlue))
            .symbolSize(20)
        }.chartYAxis {
            AxisMarks(position: .leading, values: .automatic(desiredCount: 5))
        }
        
        VStack(alignment: .leading) {
            //Text("Hello \(test.name)")
            //TextField("Name:", text: $test.name)
            Button("Enter") {
                print("SwiftUI button")
            }
        }
    }
}

struct Test {
    var name = "Toni"
}
