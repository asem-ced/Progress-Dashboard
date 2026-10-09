//
//  Progressdashboardviewmodel.swift
//  Progress Dashboard
//
//  Created by Andrei Semenov on 10/8/26.
//

import SwiftUI

@Observable
class Progressdashboardviewmodel {
    private(set) var metrics: [Metric] = [
        Metric(name: "Workout", current: 3, goal: 5, weeklyChange: 1),
        Metric(name: "Water", current: 6, goal: 8, weeklyChange: -2),
        Metric(name: "Reading Bible", current: 10, goal: 10, weeklyChange: 3)
    ]
    
    func addProgress(_ amount: Int, to metric: Metric) {
        guard let index = metrics.firstIndex(where: { $0.id == metric.id}) else { return }
        metrics[index].current = min(metrics[index].current + amount, metric.goal)
    }
}
