//
//  ContentView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var fixerUppers = fixerUpperData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(fixerUppers) { fixerUpper in
                    NavigationLink {
                        DetailsView(fixerUpper: fixerUpper)
                    } label: {
                        FixedUpperCardView(fixerUpper: fixerUpper)
                            .padding(.bottom, 50)
                    }
                    .buttonStyle(.plain)
                    .navigationTitle(Text("Fixer upper"))
                }
            }
        }
    }
}

#Preview {
   ContentView()
}
