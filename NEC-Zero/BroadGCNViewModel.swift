//
//  BroadGCNViewModel.swift
//  NEC-Zero
//
//  View model for the broad GutCheckNEC (GCN) risk assessment tool
//
//  Created by David Celaya-Gonzalez on 4/6/21.
//

import Foundation
import Combine

class BroadGCNViewModel: ObservableObject {

    @Published private var model = BroadGCN()

    // G

    // MARK: - Growth
    let growthQuestion = BroadGCNQuestion(
        emphasizedText: "Growth",
        text: "restricted (<10% size for gestation)",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var growthResponse: Bool? {
        get { model.growthRestricted }
        set { model.growthRestricted = newValue }
    }

    // MARK: - Gram
    enum WeightResponseOptions: String, CaseIterable, Identifiable {
        case weightOption1 = "<1000"
        case weightOption2 = "1000-1500"
        case weightOption3 = "1501-2000"
        case weightOption4 = "2001-2500"
        var id: String { rawValue}
    }

    let weightQuestion = BroadGCNQuestion(
        emphasizedText: "Gram",
        text: "weight at birth",
        responses: [
            (WeightResponseOptions.weightOption1.rawValue, WeightResponseOptions.weightOption1),
            (WeightResponseOptions.weightOption2.rawValue, WeightResponseOptions.weightOption2),
            (WeightResponseOptions.weightOption3.rawValue, WeightResponseOptions.weightOption3),
            (WeightResponseOptions.weightOption4.rawValue, WeightResponseOptions.weightOption4)
        ]
    )

//    let weightEmphasizedText = "Gram"
//    let weightText =
//    var weight: Int? {
//        get {
//            return model.weight
//        }
//        set {
//            model.weight = newValue
//        }
//    }
    var weightResponse: WeightResponseOptions? {
        get {
            if let _weight = model.weight {
                switch _weight {
                    case ...1000:
                        return .weightOption1
                    case 1000 ..< 1501:
                        return .weightOption2
                    case 1501 ..< 2001:
                        return .weightOption3
                    case 2001...:
                        return .weightOption4
                    default:
                        return nil
                }
            }
            return nil
        }
        set {
            switch newValue {
                case .weightOption1:
                    model.weight = 999
                case .weightOption2:
                    model.weight = 1250
                case .weightOption3:
                    model.weight = 1750
                case .weightOption4:
                    model.weight = 3000
                default:
                    model.weight = nil
            }
        }
    }

    // MARK: - Gestational Age


    // MARK: - Glucocorticoids
    let glucocorticoidsQuestion = BroadGCNQuestion(
        emphasizedText: "Glucocorticoids",
        text: "given concurrently with Indomethacin",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var glucocorticoidsResponse: Bool? {
        get { model.glucocorticoids }
        set { model.glucocorticoids = newValue }
    }

//    var G_questions<Response>: [(BroadGCNQuestion, Response)] = [
//
//    ]

    struct BroadGCNQuestion<Value> {
        var emphasizedText: String?
        let text: String
//        var response: Value?
        let responses: [(display: String, value: Value)]

//        init(emphasizedText: String?, text: String, response: Value?, responses: [(String, Value)]) {
//            self.emphasizedText = emphasizedText
//            self.text = text
//            self.response = response
//            self.responses = responses
//        }
    }

}
