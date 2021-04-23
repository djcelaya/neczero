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

//    struct BroadGCNResponse: Identifiable {
//        
//    }

    // G
    let growthQuestion = BroadGCNQuestion(
        emphasizedText: "Growth ",
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

    let weightEmphasizedText = "Gram"
    let weightText = "weight at birth"
    var weight: Int? {
        get {
            return model.weight
        }
        set {
            model.weight = newValue
        }
    }

//    var age: BroadGCNQuestion<Bool> = BroadGCNQuestion(
//        emphasizedText: "Gestational",
//        text: "Age at Birth in weeks",
//        responses: [
//            (
//        ]
//    )

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
