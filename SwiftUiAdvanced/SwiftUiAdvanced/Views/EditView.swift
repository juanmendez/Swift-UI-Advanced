//
//  EditView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/20/25.
//

import SwiftUI

struct EditView: View {
    var fixerUpper: FixerUpper
    
    var body: some View {
        VStack {
            Text("Edit \(fixerUpper.name)")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    EditView( fixerUpper: fixerUpperData.first!)
}
