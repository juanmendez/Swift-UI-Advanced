//
//  ZStackDemo0.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/15/25.
//

import SwiftUI

struct ZStackDemo0: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        ZStack {
            ForEach(colors.indices, id: \.self) { index in
                Rectangle()
                    .fill(colors[index])
                    .frame(width: 100, height: 100)
                    .offset(x: CGFloat(index) * 10.0,
                            y: CGFloat(index) * 10.0
                    )
            }
        }
    }
}

#Preview {
    ZStackDemo0()
}
