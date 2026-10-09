//
//  ContentView.swift
//  Progress Dashboard
//
//  Created by Andrei Semenov on 10/8/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = Progressdashboardviewmodel()
    
    private let logAmount = 1
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack(spacing: 16) {
                tiles
                Spacer()
                logButtons
            }
            .padding()
        }
    }
    private var backgroundGradient: some View {
        LinearGradient(colors: [.indigo, .teal], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
    
    private var tiles: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.metrics) { metric in MetricTile(name: metric.name, progress: metric.progress,
                current: metric.current, goal: metric.goal, isImproving: metric.isImproving)
            }
        }
    }
    private var logButtons: some View {
        HStack(spacing: 10) {
            ForEach(viewModel.metrics) {
                metric in Button("+\(logAmount) \(metric.name)") {
                    viewModel.addProgress(logAmount, to: metric)
                }
                .font(.subheadline)
                .foregroundStyle(.indigo)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(.white, in: Capsule())
            }
        }
    }
    
}

#Preview {
    ContentView()
}
