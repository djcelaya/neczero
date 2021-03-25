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
        ScrollView {
            Questions()
//            Results()
            FocusedGCNResultsCard(with: viewModel)
                .padding(.top, 0)
        }
        .background(Color("GutCheck Light"))
    }

    @ViewBuilder func Questions() -> some View {
        Group {
            MiniCard(title: viewModel.gestationalAgeTitle, description: viewModel.gestationalAgeDescription) {
                ForEach(FocusedGCNViewModel.GestationalAgeResponseOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.gestationalAge = option
                    }.miniButtonStyle(selected: viewModel.gestationalAge == option)
                }
            }
            MiniCard(title: viewModel.raceTitle) {
                ForEach(FocusedGCNViewModel.RaceOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.race = option
                    }.miniButtonStyle(selected: viewModel.race == option)
                }
            }
            MiniCard(title: viewModel.outbornTitle, description: viewModel.outbornDescription) {
                HStack {
                    Button("Yes") {
                        viewModel.outborn = true
                    }.miniButtonStyle(selected: viewModel.outborn ?? false)
                    Button("No") {
                        viewModel.outborn = false
                    }.miniButtonStyle(selected: viewModel.outborn != nil ? !(viewModel.outborn!) : false)
                }
            }
            MiniCard(title: viewModel.necRateTitle, description: viewModel.necRateDescription) {
                ForEach(FocusedGCNViewModel.NecRateOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.necRate = option
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 14))
                    .miniButtonStyle(selected: viewModel.necRate == option)

                }
            }
            MiniCard(title: viewModel.milkTitle, description: viewModel.milkDescription) {
                HStack {
                    Button("Yes") {
                        viewModel.milk = true
                    }.miniButtonStyle(selected: viewModel.milk ?? false)
                    Button("No") {
                        viewModel.milk = false
                    }.miniButtonStyle(selected: viewModel.milk != nil ? !(viewModel.milk!) : false)
                }
            }
            MiniCard(title: viewModel.probioticsTitle, description: viewModel.probioticsDescription) {
                HStack {
                    Button("Yes") {
                        viewModel.probiotics = true
                    }.miniButtonStyle(selected: viewModel.probiotics ?? false)
                    Button("No") {
                        viewModel.probiotics = false
                    }.miniButtonStyle(selected: viewModel.probiotics != nil ? !(viewModel.probiotics!) : false)
                }
            }
            MiniCard(title: viewModel.infectionsTitle) {
                ForEach(FocusedGCNViewModel.InfectionOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.infections = option
                    }.miniButtonStyle(selected: viewModel.infections == option)
                }
            }
            MiniCard(title: viewModel.transfusionTitle, description: viewModel.transfusionDescription) {
                HStack {
                    Button("Yes") {
                        viewModel.transfusion = true
                    }.miniButtonStyle(selected: viewModel.transfusion ?? false)
                    Button("No") {
                        viewModel.transfusion = false
                    }.miniButtonStyle(selected: viewModel.transfusion != nil ? !(viewModel.transfusion!) : false)
                }
            }
            MiniCard(title: viewModel.hypotensionTitle, description: viewModel.hypotensionDescription) {
                HStack {
                    Button("Yes") {
                        viewModel.hypotension = true
                    }.miniButtonStyle(selected: viewModel.hypotension ?? false)
                    Button("No") {
                        viewModel.hypotension = false
                    }.miniButtonStyle(selected: viewModel.hypotension != nil ? !(viewModel.hypotension!) : false)
                }
            }
            MiniCard(title: viewModel.acidosisTitle, description: viewModel.acidosisDescription) {
                HStack {
                    Button("Yes") {
                        viewModel.acidosis = true
                    }.miniButtonStyle(selected: viewModel.acidosis ?? false)
                    Button("No") {
                        viewModel.acidosis = false
                    }.miniButtonStyle(selected: viewModel.acidosis != nil ? !(viewModel.acidosis!) : false)
                }
            }.padding(.bottom)
        }
    }

    @ViewBuilder func MiniCard<Options>(title: String, description: String = "", options: () -> Options) ->
        some View where Options: View {
        VStack(alignment: .leading) {
            Text(LocalizedStringKey(stringLiteral: title))
                .font(.title3)
                .padding([.top, .leading, .trailing], 8)
            HStack {
                options()
                Spacer()
            }
            .padding([.leading, .bottom, .trailing], 8)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding([.top, .leading, .trailing])
    }

    @ViewBuilder func Results() -> some View {
        VStack {
            if let points = viewModel.points {
                HStack {
                    Text("\(points)")
                        .padding(.top)
                        .font(.system(size: 52, weight: .bold, design: .rounded))
                    Text("Points Scored")
                        .font(.headline)
                }
            } else {
                Text("Form has not been completed.")
            }
        }
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
        .background(isSelected ? Color("GutCheck Dark") : Color("GutCheck Medium"))
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
