//
//  FocusedGutCheckNECForm.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 1/6/21.
//

import SwiftUI

struct FocusedGutCheckNECForm: View {

    @ObservedObject var viewModel: FocusedGutCheckNECViewModel
    @State private var displayQuickForm = false
    @State private var questionIndex = 0
    private let backgroundGradient = Color("PrimaryColor")

    var body: some View {
        Group {
            if displayQuickForm {
                QuickForm()
            } else {
                GuidedForm()
            }
        }
        .navigationBarTitle("GutCheckNEC")
        .navigationBarItems(
            trailing:
                Button("Switch") {
                    displayQuickForm = !displayQuickForm
                }
        )
    }

    func GuidedForm() -> some View {
        TabView(selection: $questionIndex) {
            QuestionCard()
                .tag(0)
            Text("Race")
                .tag(1)
            Text("Outborn")
                .tag(2)
        }
        .background(backgroundGradient)
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeInOut)
    }

    func QuickForm() -> some View {
        Form {
            Section(header: Text("GutChecNEC (< 1500 grams)")) {
                Group {
                    Picker(selection: $viewModel.gestationalAgeIndex, label: Text("Gestational age (weeks)")) {
                        ForEach(0 ..< viewModel.gestationalAgeOptions.count) {
                            Text(viewModel.gestationalAgeOptions[$0])
                        }
                    }
                    Picker("Race", selection: $viewModel.raceIndex) {
                        ForEach(0 ..< viewModel.raceOptions.count) {
                            Text(viewModel.raceOptions[$0])
                        }
                    }
                    Toggle("Outborn", isOn: $viewModel.outborn)
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

    init(with viewModel: FocusedGutCheckNECViewModel = FocusedGutCheckNECViewModel(with: FocusedGutCheckNEC())) {
        self.viewModel = viewModel
    }
}

struct QuestionCard: View {
    @State var option1Selected = false
    @State var option2Selected = false
    @State var option3Selected = false
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Gestational age (weeks)")
                .font(.title2)
                .padding(.top)
                .padding(.horizontal)
            Text("Calculate GA in weeks at birth...")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            VStack(spacing: 10) {
                QuestionResponseButton("<28", selected: $option1Selected)
                QuestionResponseButton("28-31 6/7", selected: $option2Selected)
                QuestionResponseButton(">= 32", selected: $option3Selected)
            }
            .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct QuestionResponseButton: View {

    private let responseText: LocalizedStringKey
    @Binding var isSelected: Bool

    var body: some View {
        HStack {
            if isSelected {
                Image(systemName: "checkmark")
            }
            Button(responseText) {

            }
            .padding()
            .background(Color("AccentColor"))
            .font(.title3)
            .foregroundColor(.white)
            .cornerRadius(24)
            .shadow(radius: 8)
        }
    }

    // https://stackoverflow.com/questions/56973959/swiftui-how-to-implement-a-custom-init-with-binding-variables
    init(_ responseText: LocalizedStringKey, selected: Binding<Bool>) {
        self.responseText = responseText
        self._isSelected = selected
    }
}

struct GutCheckNECView_Previews: PreviewProvider {
    static var previews: some View {
        let model = FocusedGutCheckNEC()
        let viewModel = FocusedGutCheckNECViewModel(with: model)
        return TabView {
            NavigationView {
                FocusedGutCheckNECForm(with: viewModel)
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
