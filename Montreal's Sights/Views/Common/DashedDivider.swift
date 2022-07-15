//
//  DashedDivider.swift
//  Montreal's Sights
//
//  Created by Gordon Ng on 2022-07-14.
//

import SwiftUI

struct DashedDivider: View {
    var body: some View {
        
        GeometryReader{ geo in
            
            Path{ path in
                
                path.move(to: CGPoint.zero) // (0,0)
                path.addLine(to: CGPoint(x: geo.size.width, y:0))
                
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.gray)
            
        }
        
        
    }
}

struct DashedDivider_Previews: PreviewProvider {
    static var previews: some View {
        DashedDivider()
    }
}
