//
//  ZStackDemo1.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/15/25.
//

import SwiftUI

struct ZStackDemo1: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .alignmentGuide(.leading) {
                    d in d[.leading]
                }
                .alignmentGuide(.top) {
                    d in d[.top]
                }
            
            Text("hello world")
                .offset(x: -60, y:0)
            
            Text("hello world2")
                .offset(x: 50, y:180)
        }
    }
}

#Preview {
    ZStackDemo1()
}
