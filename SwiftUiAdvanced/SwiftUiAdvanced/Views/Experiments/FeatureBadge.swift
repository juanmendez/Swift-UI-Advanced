//
//  FeatureBadge.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/22/25.
//

import SwiftUI

struct FeaturedBadge: View {
    @State private var isAnimating = false

    var body: some View {
        Text("Featured")
            .font(.caption2)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.horizontal, isAnimating ? 15 : 10)
            .padding(.vertical, isAnimating ? 10 : 5)
            .background(.thickMaterial)
            .clipShape(Capsule())
            .animation(
                .easeInOut(duration: 2)
                    .repeatForever(),
                value: isAnimating
            )
            .overlay(
                Capsule()
                    .stroke(
                        .white
                            .opacity(isAnimating ? 0.7 : 0.3),
                        lineWidth: isAnimating ? 7 : 3
                    )
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(),
                        value: isAnimating
                    )
            )
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    ZStack {
        fixerUpperData[0].featureImage
        FeaturedBadge()
    }
}
