//
//  FocusedGutCheckNECCondensedForm.swift
//  NEC-Zero
//
//  View that displays the focused GutCheckNEC (GCN) risk assessment in the condensed format.
//
//  Created by David Celaya-Gonzalez on 1/6/21.
//

import SwiftUI

struct FocusedGCNCondensedForm: View {

    @ObservedObject var viewModel: FocusedGCNViewModel

    var body: some View {
        Form {
            Section(header: Text("GutChecNEC (< 1500 grams)")) {
                Group {
                    Picker(selection: $viewModel.gestationalAge,
                        label: Text(viewModel.gestationalAgeTitle)) {
                        ForEach(FocusedGCNViewModel.GestationalAgeResponseOptions.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    Picker(viewModel.raceTitle, selection: $viewModel.race) {
                        ForEach(FocusedGCNViewModel.RaceOptions.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
//                    Toggle("Outborn", isOn: $viewModel.outborn)
                    Picker("NICU NEC Rate", selection: $viewModel.necRateIndex) {
                        ForEach(0 ..< viewModel.necRateOptions.count) {
                            Text(viewModel.necRateOptions[$0])
                        }
                    }
                    Toggle("Exclusive human milk feeding", isOn: $viewModel.milkFeeding)
                    Toggle("Probiotics", isOn: $viewModel.probiotics)
                    Picker(selection: $viewModel.infectionsIndex, label:
                            Text("How many culture-proven infections has the infant had since day 3 of life?")) {
                        ForEach(0 ..< viewModel.infectionsOptions.count) {
                            Text(viewModel.infectionsOptions[$0])
                        }
                    }
                    Toggle("Packed Red Blood Cell transfusion history", isOn: $viewModel.prbcTransfusion)
                    Toggle("Hypotension treated with Inotropic Medication", isOn: $viewModel.hypotension)
                    Toggle("Metabolic Acidosis", isOn: $viewModel.metabolicAcidosis)
                }
                Button("Submit", action: viewModel.submit)
            }
            Section(header: Text("Results")) {
                HStack {
                    Text("Points")
                    Spacer()
                    Text("\(viewModel.points)")
                }
            }
        }
    }

    init(with viewModel: FocusedGCNViewModel = FocusedGCNViewModel(with: FocusedGutCheckNEC())) {
        self.viewModel = viewModel
    }
}

struct GutCheckNECView_Previews: PreviewProvider {
    static var previews: some View {
        let model = FocusedGutCheckNEC()
        let viewModel = FocusedGCNViewModel(with: model)
        return TabView {
            NavigationView {
                FocusedGCNCondensedForm(with: viewModel)
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
