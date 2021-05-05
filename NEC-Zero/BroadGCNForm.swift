//
//  BroadGCNForm.swift
//  NEC-Zero
//
//  View for broad GutCheckNEC (GCN) risk assessment tool.
//
//  Created by David Celaya-Gonzalez on 4/6/21.
//  Copyright © 2021 The Arizona Board of Regents on behalf of The University of Arizona.
//

import SwiftUI

struct BroadGCNForm: View {

    @ObservedObject var viewModel: BroadGCNViewModel
    @State private var sectionIndex: Int = 0
    private let backgroundColor = Color("GutCheck Light")

    var body: some View {
        ScrollView {
            LazyVStack {
                LetterSection(letter: "G") {
                    GQuestions()
                }
                LetterSection(letter: "U") {
                    UQuestions()
                }
                LetterSection(letter: "T") {
                    TQuestions()
                }
                LetterSection(letter: "C") {
                    C1Questions()
                }
                LetterSection(letter: "H") {
                    HQuestions()
                }
                LetterSection(letter: "E") {
                    EQuestions()
                }
                LetterSection(letter: "C") {
                    C2Questions()
                }
                LetterSection(letter: "K") {
                    KSection()
                }
            }
        }
        .background(backgroundColor)
        .navigationBarTitle("GutCheckNEC")
    }

    @ViewBuilder func GQuestions() -> some View {
        LazyVStack {
            MiniCard(emphasized: viewModel.growthQuestion.emphasizedText, title: viewModel.growthQuestion.text) {
                HStack {
                    Button(viewModel.growthQuestion.responses[0].display) {
                        viewModel.growthResponse = viewModel.growthQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.growthResponse ?? false)
                    Button(viewModel.growthQuestion.responses[1].display) {
                        viewModel.growthResponse = viewModel.growthQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.growthResponse != nil ? !(viewModel.growthResponse!) : false)
                }
            }.padding(.top, 12)
            MiniCard(emphasized: viewModel.weightQuestion.emphasizedText, title: viewModel.weightQuestion.text) {
                ForEach(viewModel.weightQuestion.responses, id: \.value) { response in
                    Button(response.display) {
                        viewModel.weightResponse = response.value
                    }
                    .font(.system(size: 13))
                    .miniButtonStyle(selected: viewModel.weightResponse == response.value)
                }
            }
            MiniCard(emphasized: viewModel.ageQuestion.emphasizedText, title: viewModel.ageQuestion.text) {
                ForEach(viewModel.ageQuestion.responses, id: \.value) { response in
                    Button(response.display) {
                        viewModel.ageResponse = response.value
                    }.miniButtonStyle(selected: viewModel.ageResponse == response.value)
                }
            }
            MiniCard(emphasized: viewModel.glucocorticoidsQuestion.emphasizedText, title: viewModel.glucocorticoidsQuestion.text) {
                HStack {
                    Button(viewModel.glucocorticoidsQuestion.responses[0].display) {
                        viewModel.glucocorticoidsResponse = viewModel.glucocorticoidsQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.glucocorticoidsResponse ?? false)
                    Button(viewModel.glucocorticoidsQuestion.responses[1].display) {
                        viewModel.glucocorticoidsResponse = viewModel.glucocorticoidsQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.glucocorticoidsResponse != nil ?
                        !(viewModel.glucocorticoidsResponse!) : false)
                }
            }

        }
    }

    @ViewBuilder func UQuestions() -> some View {
        LazyVStack {
            MiniCard(emphasized: viewModel.umbilicalAcidicQuestion.emphasizedText, title: viewModel.umbilicalAcidicQuestion.text) {
                HStack {
                    Button(viewModel.umbilicalAcidicQuestion.responses[0].display) {
                        viewModel.umbilicalAcidicResponse = viewModel.umbilicalAcidicQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.umbilicalAcidicResponse ?? false)
                    Button(viewModel.umbilicalAcidicQuestion.responses[1].display) {
                        viewModel.umbilicalAcidicResponse = viewModel.umbilicalAcidicQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.umbilicalAcidicResponse != nil ? !(viewModel.umbilicalAcidicResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.umbilicalProlapseQuestion.emphasizedText, title: viewModel.umbilicalProlapseQuestion.text) {
                HStack {
                    Button(viewModel.umbilicalProlapseQuestion.responses[0].display) {
                        viewModel.umbilicalProlapseResponse = viewModel.umbilicalProlapseQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.umbilicalProlapseResponse ?? false)
                    Button(viewModel.umbilicalProlapseQuestion.responses[1].display) {
                        viewModel.umbilicalProlapseResponse = viewModel.umbilicalProlapseQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.umbilicalProlapseResponse != nil ? !(viewModel.umbilicalProlapseResponse!) : false)
                }
            }
        }
    }

    @ViewBuilder func TQuestions() -> some View {
        LazyVStack {
            MiniCard(emphasized: viewModel.transfusionQuestion.emphasizedText,
                title: viewModel.transfusionQuestion.text) {
                HStack {
                    Button(viewModel.transfusionQuestion.responses[0].display) {
                        viewModel.transfusionResponse = viewModel.transfusionQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.transfusionResponse ?? false)
                    Button(viewModel.transfusionQuestion.responses[1].display) {
                        viewModel.transfusionResponse = viewModel.transfusionQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.transfusionResponse != nil ?
                        !(viewModel.transfusionResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.nicuQuestion.emphasizedText, title: viewModel.nicuQuestion.text) {
                ForEach(viewModel.nicuQuestion.responses, id: \.value) { response in
                    Button(response.display) {
                        viewModel.nicuResponse = response.value
                    }.miniButtonStyle(selected: viewModel.nicuResponse == response.value)
                }
            }
            MiniCard(emphasized: viewModel.steroidsQuestion.emphasizedText, title: viewModel.steroidsQuestion.text) {
                HStack {
                    Button(viewModel.steroidsQuestion.responses[0].display) {
                        viewModel.steroidsResponse = viewModel.steroidsQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.steroidsResponse ?? false)
                    Button(viewModel.steroidsQuestion.responses[1].display) {
                        viewModel.steroidsResponse = viewModel.steroidsQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.steroidsResponse != nil ?
                        !(viewModel.steroidsResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.feedingQuestion.emphasizedText, title: viewModel.feedingQuestion.text) {
                HStack {
                    Button(viewModel.feedingQuestion.responses[0].display) {
                        viewModel.feedingResponse = viewModel.feedingQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.feedingResponse ?? false)
                    Button(viewModel.feedingQuestion.responses[1].display) {
                        viewModel.feedingResponse = viewModel.feedingQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.feedingResponse != nil ?
                        !(viewModel.feedingResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.milkQuestion.emphasizedText, title: viewModel.milkQuestion.text) {
                HStack {
                    Button(viewModel.milkQuestion.responses[0].display) {
                        viewModel.milkResponse = viewModel.milkQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.milkResponse ?? false)
                    Button(viewModel.milkQuestion.responses[1].display) {
                        viewModel.milkResponse = viewModel.milkQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.milkResponse != nil ?
                        !(viewModel.milkResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.probioticsQuestion.emphasizedText,
                title: viewModel.probioticsQuestion.text) {
                HStack {
                    Button(viewModel.probioticsQuestion.responses[0].display) {
                        viewModel.probioticsResponse = viewModel.probioticsQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.probioticsResponse ?? false)
                    Button(viewModel.probioticsQuestion.responses[1].display) {
                        viewModel.probioticsResponse = viewModel.probioticsQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.probioticsResponse != nil ?
                        !(viewModel.probioticsResponse!) : false)
                }
            }
        }
    }

    @ViewBuilder func C1Questions() -> some View {
        LazyVStack {
            MiniCard(emphasized: viewModel.coldQuestion.emphasizedText, title: viewModel.coldQuestion.text) {
                HStack {
                    Button(viewModel.coldQuestion.responses[0].display) {
                        viewModel.coldResponse = viewModel.coldQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.coldResponse ?? false)
                    Button(viewModel.coldQuestion.responses[1].display) {
                        viewModel.coldResponse = viewModel.coldQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.coldResponse != nil ? !(viewModel.coldResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.cocaineQuestion.emphasizedText, title: viewModel.cocaineQuestion.text) {
                HStack {
                    Button(viewModel.cocaineQuestion.responses[0].display) {
                        viewModel.cocaineResponse = viewModel.cocaineQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.cocaineResponse ?? false)
                    Button(viewModel.cocaineQuestion.responses[1].display) {
                        viewModel.cocaineResponse = viewModel.cocaineQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.cocaineResponse != nil ?
                        !(viewModel.cocaineResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.abruptionQuestion.emphasizedText, title: viewModel.abruptionQuestion.text) {
                HStack {
                    Button(viewModel.abruptionQuestion.responses[0].display) {
                        viewModel.abruptionResponse = viewModel.abruptionQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.abruptionResponse ?? false)
                    Button(viewModel.abruptionQuestion.responses[1].display) {
                        viewModel.abruptionResponse = viewModel.abruptionQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.abruptionResponse != nil ?
                        !(viewModel.abruptionResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.apgarQuestion.emphasizedText, title: viewModel.apgarQuestion.text) {
                HStack {
                    Button(viewModel.apgarQuestion.responses[0].display) {
                        viewModel.apgarResponse = viewModel.apgarQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.apgarResponse ?? false)
                    Button(viewModel.apgarQuestion.responses[1].display) {
                        viewModel.apgarResponse = viewModel.apgarQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.apgarResponse != nil ? !(viewModel.apgarResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.compressionsQuestion.emphasizedText,
                title: viewModel.compressionsQuestion.text) {
                HStack {
                    Button(viewModel.compressionsQuestion.responses[0].display) {
                        viewModel.compressionsResponse = viewModel.compressionsQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.compressionsResponse ?? false)
                    Button(viewModel.compressionsQuestion.responses[1].display) {
                        viewModel.compressionsResponse = viewModel.compressionsQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.compressionsResponse != nil ? !(viewModel.compressionsResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.epinephrineQuestion.emphasizedText,
                title: viewModel.epinephrineQuestion.text) {
                HStack {
                    Button(viewModel.epinephrineQuestion.responses[0].display) {
                        viewModel.epinephrineResponse = viewModel.epinephrineQuestion.responses[0].value
                    }.miniButtonStyle(selected: viewModel.epinephrineResponse ?? false)
                    Button(viewModel.epinephrineQuestion.responses[1].display) {
                        viewModel.epinephrineResponse = viewModel.epinephrineQuestion.responses[1].value
                    }.miniButtonStyle(selected: viewModel.epinephrineResponse != nil ?
                        !(viewModel.epinephrineResponse!) : false)
                }
            }
            MiniCard(emphasized: viewModel.necRateQuestion.emphasizedText, title: viewModel.necRateQuestion.text) {
                ForEach(viewModel.necRateQuestion.responses, id: \.value) { response in
                    Button(response.display) {
                        viewModel.necRateResponse = response.value
                    }.miniButtonStyle(selected: viewModel.necRateResponse == response.value)
                }
            }
        }
    }

    @ViewBuilder func HQuestions() -> some View {
        LazyVStack {
            Text("H")
        }
    }

    @ViewBuilder func EQuestions() -> some View {
        LazyVStack {
            Text("E")
        }
    }

    @ViewBuilder func C2Questions() -> some View {
        LazyVStack {
            Text("C")
        }
    }

    @ViewBuilder func KSection() -> some View {
        Text("K")
    }

    init(with viewModel: BroadGCNViewModel = BroadGCNViewModel()) {
        self.viewModel = viewModel
    }
}

struct LetterSection<Content>: View where Content: View {
    let letter: String
    let content: () -> Content
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "\(letter.lowercased()).circle.fill")
                        .foregroundColor(Color("GutCheck Medium"))
//                        .font(.system(size: 300))
                        .font(.system(size: 150))
                }
                Spacer()
            }
            content()
        }
    }
}

struct BroadGCNForm_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                BroadGCNForm()
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
