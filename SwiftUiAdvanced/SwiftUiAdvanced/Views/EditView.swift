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

            TextField(
                "Renovatin cost",
                value: $fixerUpperToEdit.renovationCost,
                formatter: NumberFormatter()
            )
            .keyboardType(.numberPad)

            Toggle(isOn: $fixerUpperToEdit.isFavorite) {
                Text("Favorite")
            }

            DatePicker(
                selection: Binding(
                    get: {
                        fixerUpperToEdit.plannedVisitDate ?? Date()
                    },
                    set: { value in
                        fixerUpperToEdit.plannedVisitDate = value
                    }
                ),
                displayedComponents: .date
            ) {
                Text("Planed visit date")
            }.datePickerStyle(.compact)

            Picker(
                selection: $fixerUpperToEdit.renovationDifficulty,
                label: /*@START_MENU_TOKEN@*/ Text("Picker") /*@END_MENU_TOKEN@*/
            ) {
                ForEach(FixerUpper.RenovationDifficulty.allCases, id: \.self) { renovationDifficulty in
                    Text(renovationDifficulty.rawValue).tag(renovationDifficulty)
                }
            }
            .pickerStyle(.segmented)

        }
        .padding()
    }
}

#Preview {
    EditView(fixerUpper: fixerUpperData.first!)
}
