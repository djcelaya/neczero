//
//  FocusedGCNGuidedForm.swift
//  NEC-Zero
//
//  View that displays the focused GutCheckNEC (GCN) risk assessment in the guided format.
//
//  Created by David Celaya-Gonzalez on 3/3/21.
//

import SwiftUI

struct FocusedGCNGuidedForm: View {

    @ObservedObject var viewModel: FocusedGCNViewModel
    @State private var questionIndex: Int
    private let backgroundGradient = Color("PrimaryColor")

    var body: some View {
        TabView(selection: $questionIndex) {
            Card(title: viewModel.gestationalAgeTitle, description: viewModel.gestationalAgeDescription) {
                ForEach(FocusedGCNViewModel.GestationalAgeResponseOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.gestationalAge = option
                        advance()
                    }.optionButtonStyle(selected: viewModel.gestationalAge == option)
                }
            }.tag(0)
            Card(title: viewModel.raceTitle) {
                ForEach(FocusedGCNViewModel.RaceOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.race = option
                        advance()
                    }.optionButtonStyle(selected: viewModel.race == option)
                }
            }.tag(1)
            Card(title: viewModel.outbornTitle, description: viewModel.outbornDescription) {
                VStack {
                    Button("Yes") {
                        viewModel.outborn = true
                        advance()
                    }.optionButtonStyle(selected: viewModel.outborn ?? false)
                    Button("No") {
                        viewModel.outborn = false
                        advance()
                    }.optionButtonStyle(selected: viewModel.outborn != nil ? !(viewModel.outborn!) : false)
                }
            }.tag(2)
            Card(title: viewModel.necRateTitle, description: viewModel.necRateDescription) {
                ForEach(FocusedGCNViewModel.NecRateOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.necRate = option
                        advance()
                    }.optionButtonStyle(selected: viewModel.necRate == option)
                }
            }.tag(3)
            Card(title: viewModel.milkTitle, description: viewModel.milkDescription) {
                VStack {
                    Button("Yes") {
                        viewModel.milk = true
                        advance()
                    }.optionButtonStyle(selected: viewModel.milk ?? false)
                    Button("No") {
                        viewModel.milk = false
                        advance()
                    }.optionButtonStyle(selected: viewModel.milk != nil ? !(viewModel.milk!) : false)
                }
            }.tag(4)
            Card(title: viewModel.probioticsTitle, description: viewModel.probioticsDescription) {
                VStack {
                    Button("Yes") {
                        viewModel.probiotics = true
                        advance()
                    }.optionButtonStyle(selected: viewModel.probiotics ?? false)
                    Button("No") {
                        viewModel.probiotics = false
                        advance()
                    }.optionButtonStyle(selected: viewModel.probiotics != nil ? !(viewModel.probiotics!) : false)
                }
            }.tag(5)
        }
        .background(backgroundGradient)
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeInOut)
    }

    @ViewBuilder func Card<Options>(title: String, description: String = "", options: () -> Options) ->
        some View where Options: View {
        VStack(alignment: .center, spacing: 16) {
            Text(title)
                .font(.title2)
                .padding(.top)
                .padding(.horizontal)
            Text(LocalizedStringKey(stringLiteral: description))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            VStack(spacing: 10) {
                options()
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding()
    }

    func advance() {
        questionIndex += 1
    }

    init(with viewModel: FocusedGCNViewModel = FocusedGCNViewModel()) {
        self.viewModel = viewModel
        _questionIndex = State(initialValue: 0)
    }
}

struct OptionButtonStyle: ViewModifier {
    var isSelected: Bool
    func body(content: Content) -> some View {
        HStack {
            if isSelected {
                Image(systemName: "checkmark")
            }
            content
        }
        .padding()
        .background(Color("AccentColor"))
        .font(.title3)
        .foregroundColor(.white)
        .cornerRadius(24)
        .shadow(radius: 8)
    }
    init(selected: Bool) {
        isSelected = selected
    }
}

extension View {
    func optionButtonStyle(selected: Bool = false) -> some View {
        return self.modifier(OptionButtonStyle(selected: selected))
    }
}
struct FocusedGCNGuidedForm_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                FocusedGCNGuidedForm()
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
