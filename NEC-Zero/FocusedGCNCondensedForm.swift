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
        VStack(alignment: .leading) {
            MiniCard(title: viewModel.gestationalAgeTitle) {
                ForEach(FocusedGCNViewModel.GestationalAgeResponseOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.gestationalAge = option
                    }.miniButtonStyle(selected: viewModel.gestationalAge == option)
                }
            }
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
    //                    Toggle("Probiotics", isOn: $viewModel.probiotics)
                        Picker(selection: $viewModel.infectionsIndex, label:
                                Text("How many culture-proven infections has the infant had since day 3 of life?")) {
                            ForEach(0 ..< viewModel.infectionsOptions.count) {
                                Text(viewModel.infectionsOptions[$0])
                            }
                        }
                        Toggle("Packed Red Blood Cell transfusion history", isOn: $viewModel.prbcTransfusion)
    //                    Toggle("Hypotension treated with Inotropic Medication", isOn: $viewModel.hypotension)
                        Toggle("Metabolic Acidosis", isOn: $viewModel.metabolicAcidosis)
                    }
                    Button("Submit", action: viewModel.submit)
                }
                Section(header: Text("Results")) {
                    HStack {
                        Text("Points")
                        Spacer()
                        if viewModel.points != nil {
                            Text("\(viewModel.points!)")
                        }
                    }
                }
            }
        }
        .background(Color("GutCheck Light"))
    }

    @ViewBuilder func MiniCard<Options>(title: String, description: String = "", options: () -> Options) ->
        some View where Options: View {
        VStack(alignment: .leading) {
            Text(LocalizedStringKey(stringLiteral: title))
                .font(.title3)
                .padding([.top, .leading, .trailing], 8)
            HStack {
                options()
            }
            .padding([.leading, .bottom, .trailing], 8)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }

    init(with viewModel: FocusedGCNViewModel = FocusedGCNViewModel(with: FocusedGutCheckNEC())) {
        self.viewModel = viewModel
    }
}

struct OptionMiniButtonStyle: ViewModifier {
    var isSelected: Bool
    func body(content: Content) -> some View {
        HStack {
            if isSelected {
                Image(systemName: "checkmark")
            }
            content
        }
        .padding(6)
        .background(Color("GutCheck Medium"))
        .font(.body)
        .foregroundColor(.white)
        .cornerRadius(8)
        .shadow(radius: 8)
    }
    init(selected: Bool) {
        isSelected = selected
    }
}

private extension View {
    func miniButtonStyle(selected: Bool = false) -> some View {
        return self.modifier(OptionMiniButtonStyle(selected: selected))
    }
}

struct GutCheckNECView_Previews: PreviewProvider {
    static var previews: some View {
        let model = FocusedGutCheckNEC()
        let viewModel = FocusedGCNViewModel(with: model)
        return TabView {
            NavigationView {
                FocusedGCNCondensedForm(with: viewModel)
                    .navigationBarTitle("GutCheckNEC")
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
