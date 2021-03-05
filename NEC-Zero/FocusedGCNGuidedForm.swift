//
//  FocusedGCNGuidedForm.swift
//  NEC-Zero
//
//  View that displays the focused GutCheckNEC (GCN) risk assessment in either the guided format.
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
            ForEach(viewModel.questions) { question in
                QuestionCard(for: question).tag(question.id)
            }
        }
        .background(backgroundGradient)
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeInOut)
    }

    init(with viewModel: FocusedGCNViewModel = FocusedGCNViewModel()) {
        self.viewModel = viewModel
        let firstQuestion = viewModel.questions.first
        _questionIndex = State(initialValue: firstQuestion!.id)
    }
}

struct QuestionCard: View {
    let title: LocalizedStringKey
    private(set) var description: LocalizedStringKey?
    let responses: [FocusedGCNViewModel.Question.Response]

    @State var option1Selected = false
    @State var option2Selected = false
    @State var option3Selected = false
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(title)
                .font(.title2)
                .padding(.top)
                .padding(.horizontal)
            Text(description ?? "")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            VStack(spacing: 10) {
//                QuestionResponseButton("<28", selected: $option1Selected)
//                QuestionResponseButton("28-31 6/7", selected: $option2Selected)
//                QuestionResponseButton(">= 32", selected: $option3Selected)
                ForEach(responses) { response in
                    QuestionResponseButton(response.displayValue)
                }
            }
            .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }

    init(for question: FocusedGCNViewModel.Question) {
        title = LocalizedStringKey(stringLiteral: question.title)
        if let description = question.description {
            self.description = LocalizedStringKey(stringLiteral: description)
        }
        responses = question.responses
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

    init(_ responseText: String) {
        self.responseText = LocalizedStringKey(stringLiteral: responseText)
        _isSelected = .constant(false)
    }
}

struct FocusedGCNGuidedForm_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                FocusedGCNGuidedForm()
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
