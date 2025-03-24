//
//  TapToPeekView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/22/25.
//

import SwiftUI

struct TapToPeekView: View {
    @State private var selectedFixerUpper: FixerUpper? = nil
    @Namespace var tapToPeekAnimationNamespace
    var fixerUpper = fixerUpperData[0]
    
    
    /**
     Similar to transitions in Android between activities or fragments, here we can key which element pairs with the next screen.
     */
    private static let FIXER_UPPER_IMAGE_ID = "fixerUpperImage"
    private static let TOGGLE_BUTTON_ID = "toggleButton"
    private static let SCREEN_DETAILS = "screenDetails"
    
    var body: some View {
        if (selectedFixerUpper != nil) == true {
            expandedView
        } else {
            collapsedView
        }
    }
    
    var expandedView: some View {
        ZStack(alignment: .bottomTrailing) {
            fixerUpper.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .matchedGeometryEffect(id: TapToPeekView.FIXER_UPPER_IMAGE_ID, in: tapToPeekAnimationNamespace)
                .frame(width: 300 , height: 300)
            
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 20))
                .padding(10)
                .foregroundStyle(.white)
                .matchedGeometryEffect(id: TapToPeekView.TOGGLE_BUTTON_ID, in: tapToPeekAnimationNamespace)
                .alignmentGuide(.bottom) { d in
                    d[.bottom] + 260
                }
                .onTapGesture {
                    withAnimation {
                        selectedFixerUpper = nil
                    }
                }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(fixerUpper.name)
                    .font(.headline)
                    .bold()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Asking Price:")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(fixerUpper.formattedAskingPrice)
                            .font(.title3)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Condition:")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(fixerUpper.condition.rawValue)
                            .font(.title3)
                    }
                }
            }
            .padding()
            .frame(width: 300)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .matchedGeometryEffect(id: TapToPeekView.SCREEN_DETAILS, in: tapToPeekAnimationNamespace)
            .alignmentGuide(.bottom) { d in
                d[.bottom]
            }
        }
    }
    
    var collapsedView: some View {
        ZStack {
            fixerUpper.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .matchedGeometryEffect(id: TapToPeekView.FIXER_UPPER_IMAGE_ID, in: tapToPeekAnimationNamespace)
                .frame(width: 100 , height: 100)
            
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20))
                .padding(10)
                .foregroundStyle(.primary)
                .background(.thinMaterial)
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation {
                        selectedFixerUpper = fixerUpper
                    }
                }
                .matchedGeometryEffect(id: TapToPeekView.TOGGLE_BUTTON_ID, in: tapToPeekAnimationNamespace)
            
            VStack(alignment: .leading, spacing: 10) {
            }
            .padding()
            .frame(width: 300, height: 0)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .matchedGeometryEffect(id: TapToPeekView.SCREEN_DETAILS, in: tapToPeekAnimationNamespace)
            .offset(y: 200)
        }
    }
}

#Preview {
    TapToPeekView()
}
