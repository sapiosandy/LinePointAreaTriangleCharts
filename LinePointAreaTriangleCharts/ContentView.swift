//
//  ContentView.swift
//  LinePointAreaTriangleCharts
//
//  Created by Sandra Gomez on 4/10/24.
//

import SwiftUI
import Charts

struct SalesPeople: Identifiable {
    var name: String
    var sales: Int
    var id: String {name}
}

var mySalesArray: [SalesPeople] = [
    .init(name: "Oscar", sales: 50),
    .init(name: "Mayer", sales: 43),
    .init(name: "George", sales: 62),
    .init(name: "Hormel", sales: 26)
]

enum ChartType {
    case bar
    case line
    case point
    case area
    case rectangle
}

struct ContentView: View {
    @State var whichChart: ChartType = ChartType.bar
    
    var body: some View {
        VStack {
            Chart(mySalesArray) { z in
                switch whichChart {
                case .bar:
                    BarMark(x: .value("Name", z.name),
                            y: .value("Sales", z.sales))
                    
                case .line:
                    LineMark(x: .value("Name", z.name),
                             y: .value("Sales", z.sales))
                    
                case .point:
                    PointMark(x: .value("Name", z.name),
                              y: .value("Sales", z.sales))
                    
                case .area:
                    AreaMark(x: .value("Name", z.name),
                             y: .value("Sales", z.sales))
                    
                case .rectangle:
                    RectangleMark(x: .value("Name", z.name),
                                  y: .value("Sales", z.sales))
                }
            }
            Picker(selection: $whichChart, label: Text("")) {
                Text("Bar chart").tag(ChartType.bar)
                Text("Line chart").tag(ChartType.line)
                Text("Point chart").tag(ChartType.point)
                Text("Area chart").tag(ChartType.area)
                Text("Rectangle chart").tag(ChartType.rectangle)
            }
        }
    }
}

#Preview {
    ContentView()
}
