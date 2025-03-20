//
//  EditView.swift
//  SwiftUiAdvanced
//
//  Created by Mendez, Juan on 3/20/25.
//

import SwiftUI

struct EditView: View {
    @Binding
    var fixerUpper: FixerUpper
    
    var body: some View {
        VStack {
            TextField("Edit \(fixerUpper.name)", text: $fixerUpper.name)
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    @Previewable
    @State var fixerUpperToEdit = fixerUpperData.first!
    
    EditView( fixerUpper: $fixerUpperToEdit)
}
