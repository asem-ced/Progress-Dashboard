//
//  Progressring.swift
//  Progress Dashboard
//
//  Created by Andrei Semenov on 10/8/26.
//

import SwiftUI

struct ProgressRing: Shape {
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -90 + 360 * progress), clockwise: false)
        return path
    }
}
#Preview {
    ProgressRing(progress: 0.6)
        .stroke(.teal, style: StrokeStyle(lineWidth: 14, lineCap: .round))
        .frame(width: 100, height: 100)
}
