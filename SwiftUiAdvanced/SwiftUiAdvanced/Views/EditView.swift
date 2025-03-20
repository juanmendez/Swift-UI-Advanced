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
        /**
         The bindable annotation is only available for ObservableObjects, not structs..
         if FixerUpper were a Struct, then we would use instead Binding
         */
        @Bindable var fixerUpperToEdit = self.fixerUpper
        VStack {
            TextField("Edit \(fixerUpperToEdit.name)", text: $fixerUpperToEdit.name)
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    EditView(fixerUpper: fixerUpperData.first!)
}
