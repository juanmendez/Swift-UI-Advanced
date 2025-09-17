//
//  ImageThumbnailsRow.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 9/17/25.
//

import SwiftUI

struct ImageThumbnailsRow: View {
    @State private var fixerUppers = fixerUpperData

    let thumbnailSize: CGFloat = 53
    let spacing: CGFloat = 8

    var body: some View {

        GeometryReader { geometry in
            let eachThumbnailWidth = thumbnailSize + spacing
            let availableWidth = geometry.size.width + spacing

            let availableCount = Int(availableWidth / eachThumbnailWidth)
            let showPlus = fixerUppers.count > availableCount
            let limitedCount = showPlus ? availableCount - 1 : availableCount
            let availableFixerUppers = Array(fixerUppers.prefix(limitedCount))

            HStack(spacing: spacing) {
                ForEach(availableFixerUppers) { fixerUpper in
                    fixerUpper
                        .image
                        .resizable()
                        .frame(width: thumbnailSize, height: thumbnailSize)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                if showPlus {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green)

                        Text("\(fixerUppers.count - availableFixerUppers.count)+")

                    }
                    .frame(width: thumbnailSize, height: thumbnailSize)
                }
            }
        }
        .padding()
        .frame(height: thumbnailSize)

    }
}

#Preview {
    ImageThumbnailsRow()
}
