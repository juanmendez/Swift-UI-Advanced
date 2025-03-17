//
//  ZStackDemo1.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/15/25.
//

import SwiftUI

struct ZStackDemo1: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
            
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
            
            
        }
    }
}

#Preview {
    ZStackDemo1()
}
