//
//  Metrictile.swift
//  Progress Dashboard
//
//  Created by Andrei Semenov on 10/8/26.
//

import SwiftUI

struct MetricTile: View {
    let name: String
    let progress: Double
    let current: Int
    let goal: Int
    let isImproving: Bool
    
    private let ringStyle = StrokeStyle(lineWidth: 9, lineCap: .round)
    
    private var isComplete: Bool {
        progress >= 1.0
    }
    
    private var percentText: String {
        "\(Int((progress * 100).rounded()))%"
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(name)
                .font(.headline)
            ring
            Text("\(current) of \(goal)")
                .font(.caption)
                .foregroundStyle(.gray)
            trendArrow
            if isComplete {
                goalBadge
            }
        }
        .padding(16)
        .frame(width: 150)
        .foregroundStyle(.black)
        .background(tileBackground)
    }
    
    private var ring: some View {
        ZStack {
            ZStack {
                ProgressRing(progress: 1.0)
                    .stroke(Color.gray.opacity(0.2), style: ringStyle)
                ProgressRing(progress: progress)
                    .stroke(.teal, style: ringStyle)
            }
            .padding(ringStyle.lineWidth / 2)
            
            Text(percentText)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(width: 90, height: 90)
    }
    
    private var trendArrow: some View {
        TrendArrow()
            .fill(isImproving ? .green : .red)
            .frame(width: 12, height: 12)
            .rotationEffect(.degrees(isImproving ? 135 : -45))
    }
    
    private var goalBadge: some View {
        Text("Goal!")
            .font(.caption)
            .bold()
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(.green, in: Capsule())
    }
    
    private var tileBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
    }
    
}

#Preview {
    MetricTile(name: "Water", progress: 0.75, current: 6, goal: 8, isImproving: false)
        .padding()
}
