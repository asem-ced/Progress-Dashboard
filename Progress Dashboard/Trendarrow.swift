//
//  Trendarrow.swift
//  Progress Dashboard
//
//  Created by Andrei Semenov on 10/8/26.
//

import SwiftUI

struct TrendArrow: Shape {
    func path(in rect: CGRect) -> Path {
        
        let height = rect.width / 2
        let top = rect.midY - height / 2
        let bottom = rect.midY + height / 2
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    TrendArrow()
        .fill(.green)
        .frame(width: 100, height: 100)
}
