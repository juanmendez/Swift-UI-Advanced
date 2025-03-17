//
//  FixedUpperCardView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/15/25.
//

import SwiftUI

struct FixedUpperCardView: View {
    var fixerUpper: FixerUpper
    let backgroundImageWidth: CGFloat = 380
    let backgroundImageHeight: CGFloat = 250

    var body: some View {
        ZStack {
            fixerUpper.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: backgroundImageWidth, height: backgroundImageHeight)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            VStack {
                Text(fixerUpper.name)
                    .font(.headline)
                    .padding(.top, 20)

                HStack(spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Asking price")
                            .foregroundStyle(.secondary)
                        Text(fixerUpper.formattedAskingPrice)
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)

                    Divider()

                    VStack(alignment: .leading) {
                        Text("Condition")
                            .foregroundStyle(.secondary)
                        Text(fixerUpper.condition.rawValue)
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)

                    Divider()

                    VStack(alignment: .leading) {
                        Text("Expected ROI")
                            .foregroundStyle(.secondary)
                        Text(fixerUpper.formattedExpectedROI)
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)

                }
                .frame(height: 44)

                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: fixerUpper.isFavorite ? "star.fill" : "star")
                        Divider()
                        Image(systemName: "ellipsis")
                    }
                    .padding()
                    .frame(height: 44)
                }
                .background(.ultraThinMaterial)
            }
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(
                        LinearGradient(
                            colors: [.clear, .primary, .clear], startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ).opacity(0.3)
                    )
            }
            .padding(10)
            .frame(maxWidth: 375)
            .offset(y: 94)
        }
    }
}

#Preview {
    FixedUpperCardView(fixerUpper: fixerUpperData[0])
}
