//
//  ResultsCard.swift
//  NEC-Zero
//
//  Created by David Celaya on 3/16/21.
//

import SwiftUI

struct FocusedGCNResultsCard: View {

    @ObservedObject var viewModel: FocusedGCNViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(spacing: 10) {
//                if let points = viewModel.points {
                if viewModel.isCompleted(), let points = viewModel.points {
                    riskScoreCard(points: points)
                } else {
                    incompleteFormCard
                }
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding()
    }

    @ViewBuilder func riskScoreCard(points: Int) -> some View {
        Text("\(points)")
            .padding(.top)
            .font(.system(size: 52, weight: .bold, design: .rounded))
        Text("Points Scored")
            .font(.headline)
        Text(viewModel.risk.rawValue)
            .padding()
            .font(.largeTitle)
            .foregroundColor(viewModel.risk.color)
    }

    var incompleteFormCard: some View {
        VStack {
            Text("Please respond to all 10 questions to receive a risk score.")
                .padding()
                .font(.headline)
            if let indices = viewModel.incompleteQuestionIndices() {
                Text("You have not responded to question:")
                ForEach(indices, id: \.self) { index in
                    Text("- \(index)")
                }
            }
        }
    }

    init(with viewModel: FocusedGCNViewModel) {
        self.viewModel = viewModel
    }
}

extension FocusedGCNViewModel.RiskLevels {
    var color: Color {
        switch self {
            case .none:
                return .black
            case .low:
                return .blue
            case .moderate:
                return .orange
            case .high:
                return .red
            case .veryHigh:
                return .red
        }
    }
}

struct ResultsCard_Previews: PreviewProvider {
    static var previews: some View {
//        TabView {
//            NavigationView {
//                TabView(selection: .constant(0)) {
//                    FocusedGCNResultsCard(with: FocusedGCNViewModel())
////                    FocusedGCNResultsCard()
//                }
//                .background(Color("PrimaryColor"))
//                .tabViewStyle(PageTabViewStyle())
//                .navigationBarTitle("GutCheckNEC", displayMode: .inline)
//
//            }.tabItem {
//                VStack {
//                    Image(systemName: "heart.text.square")
//                    Text("GutCheckNEC")
//                }
//            }
//        }
        Group {
            TabView {
                NavigationView {
                    FocusedGCNGuidedForm(with: FocusedGCNViewModel.lowRiskTestData)
                        .navigationBarTitle("GutCheckNEC")
                }.tabItem {
                    VStack {
                        Image(systemName: "heart.text.square")
                        Text("GutCheckNEC")
                    }
                }
            }.accentColor(Color("GutCheck Medium"))
            TabView {
                NavigationView {
                    FocusedGCNGuidedForm()
                        .navigationBarTitle("GutCheckNEC")
//                    FocusedGCNResultsCard(with: FocusedGCNViewModel())
                }.tabItem {
                    VStack {
                        Image(systemName: "heart.text.square")
                        Text("GutCheckNEC")
                    }
                }
            }.accentColor(Color("GutCheck Medium"))
        }
    }
}
