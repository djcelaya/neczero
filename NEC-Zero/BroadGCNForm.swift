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
//        TabView(selection: $sectionIndex) {
//            LetterSection(letter: "G") {
//                Text("Hello World")
//            }.tag(0)
//            LetterSection(letter: "U") {
//                Text("Hello World")
//            }.tag(1)
//            Text("T").tag(2)
//            Text("C").tag(3)
//            Text("H").tag(4)
//            Text("E").tag(5)
//            Text("C").tag(6)
//            Text("K").tag(7)
//        }
        ScrollView {
            LazyVStack {
                LetterSection(letter: "G") {
                    GQuestions()
                }
                LetterSection(letter: "U") {
                    UQuestions()
                }
                Text("T")
                Text("C")
                Text("H")
                Text("E")
                Text("C")
                Text("K")
            }
        }
        .background(backgroundColor)
//        .tabViewStyle(PageTabViewStyle())
//        .animation(.easeInOut)
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
                        .font(.system(size: 300))
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
