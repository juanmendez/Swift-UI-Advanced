//
//  FeaturedFixerUpperPageView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/24/25.
//
import SwiftUI

struct FeaturedFixerUpperPageView: View {
    let fixerUpper: FixerUpper
    
    var body: some View {
        fixerUpper.featureImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(FeaturedFixerUpperTextOverlay(renovationProject: self.fixerUpper))
            .overlay(
                FeaturedBadge()
                    .offset(x: 130, y: -90)
            )
    }
}

struct FeaturedFixerUpperTextOverlay: View {
    let renovationProject: FixerUpper
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(renovationProject.name)
                    .font(.title)
                    .bold()
                
                Text(renovationProject.formattedAskingPrice)
                    .font(.title2)
            }
            .padding()
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    FeaturedFixerUpperPageView(fixerUpper: featuredFixerUpperData[0])
}
