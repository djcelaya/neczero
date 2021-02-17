//
//  GutCheckNECView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 1/6/21.
//

import SwiftUI

struct GutCheckNECForm: View {

    @ObservedObject var viewModel: GutCheckNECViewModel
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

    func QuestionCard() -> some View {
        VStack {
            Text("Gestational age (weeks)")
            Text("Calculate GA in weeks at birth based preferably on due date determined by 1st trimester ultrasound. If that is unavailable, use the gestational age assessment at delivery (Ballard or Dubowitz)")
            Button("<28") {

            }
            Button("28-31 6/7") {

            }
            Button(">= 32") {

            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
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

    init(with viewModel: GutCheckNECViewModel = GutCheckNECViewModel(with: GutCheckNEC())) {
        self.viewModel = viewModel
    }
}

struct GutCheckNECView_Previews: PreviewProvider {
    static var previews: some View {
        let model = GutCheckNEC()
        let viewModel = GutCheckNECViewModel(with: model)
        return TabView {
            NavigationView {
                GutCheckNECForm(with: viewModel)
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
