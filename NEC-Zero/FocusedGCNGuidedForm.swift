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
    @State private var questionIndex: String
    private let backgroundGradient = Color("PrimaryColor")

    var body: some View {
        TabView(selection: $questionIndex) {
            Card(title: viewModel.gestationAgeTitle, description: viewModel.gestationAgeDescription) {
                ForEach(FocusedGCNViewModel.GestationalAgeResponseOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.selectedGestationAgeResponse = option
                    }.optionButtonStyle(selected: viewModel.selectedGestationAgeResponse == option)
                }
            }.tag(viewModel.gestationAgeTitle)
            Card(title: viewModel.raceTitle) {
                ForEach(FocusedGCNViewModel.RaceOptions.allCases) { option in
                    Button(option.rawValue) {
                        viewModel.race = option
                    }.optionButtonStyle(selected: viewModel.race == option)
                }
            }.tag(viewModel.raceTitle)
            Card(title: viewModel.outbornTitle, description: viewModel.outbornDescription) {
                VStack {
                    Button("Yes") {
                        viewModel.outborn = true
                    }.optionButtonStyle(selected: viewModel.outborn)
                    Button("No") {
                        viewModel.outborn = false
                    }.optionButtonStyle(selected: viewModel.outborn)
                }
            }.tag(viewModel.outbornTitle)
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
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }

    init(with viewModel: FocusedGCNViewModel = FocusedGCNViewModel()) {
        self.viewModel = viewModel
        _questionIndex = State(initialValue: viewModel.gestationAgeTitle)
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

//struct QuestionCard: View {
//    let title: LocalizedStringKey
//    private(set) var description: LocalizedStringKey?
//    var responses: [FocusedGCNViewModel.Question.Response]
//
//    @State var option1Selected = false
//    @State var option2Selected = false
//    @State var option3Selected = false
//    var body: some View {
//        VStack(alignment: .center, spacing: 16) {
//            Text(title)
//                .font(.title2)
//                .padding(.top)
//                .padding(.horizontal)
//            Text(description ?? "")
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//            VStack(spacing: 10) {
////                QuestionResponseButton("<28", selected: $option1Selected)
////                QuestionResponseButton("28-31 6/7", selected: $option2Selected)
////                QuestionResponseButton(">= 32", selected: $option3Selected)
//                ForEach(responses) { response in
////                    QuestionResponseButton(response.displayValue, selected: response.isSelected)
////                    QuestionResponseButton(for: response)
//                }
//            }
//            .padding(.bottom)
//        }
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//    }
//
//    init(for question: FocusedGCNViewModel.Question) {
//        title = LocalizedStringKey(stringLiteral: question.title)
//        if let description = question.description {
//            self.description = LocalizedStringKey(stringLiteral: description)
//        }
//        responses = question.responses
//    }
//}

//struct QuestionResponseButton: View {
//
//    private let responseText: LocalizedStringKey
//    @Binding var isSelected: Bool
//    //var response: FocusedGCNViewModel.Question.Response
//
//    var body: some View {
//        HStack {
//            if isSelected {
//                Image(systemName: "checkmark")
//            }
//            Button(responseText) {
//                isSelected = true
//            }
//            .padding()
//            .background(Color("AccentColor"))
//            .font(.title3)
//            .foregroundColor(.white)
//            .cornerRadius(24)
//            .shadow(radius: 8)
//        }
//    }
//
//    // https://stackoverflow.com/questions/56973959/swiftui-how-to-implement-a-custom-init-with-binding-variables
////    init(_ responseText: LocalizedStringKey, selected: Binding<Bool>) {
////        self.responseText = responseText
////        self._isSelected = selected
////    }
//
//    init(_ responseText: String, selected: Binding<Bool>) {
//        self.responseText = LocalizedStringKey(stringLiteral: responseText)
//        _isSelected = selected
//    }
//
////    init(for response: FocusedGCNViewModel.Question.Response) {
////        responseText = LocalizedStringKey(stringLiteral: response.displayValue)
////        _isSelected = State(initialValue: response.isSelected)
////        self.response = response
////    }
//}

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
