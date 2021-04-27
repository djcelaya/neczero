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
    enum AgeResponseOptions: String, CaseIterable, Identifiable {
        case ageOption1 = "<28"
        case ageOption2 = "28-31 6/7"
        case ageOption3 = "32-33 6/7"
        case ageOption4 = "> 34"
        var id: String { rawValue }
    }

    let ageQuestion = BroadGCNQuestion(
        emphasizedText: "Gestational",
        text: "Age at Birth in weeks",
        responses: [
            (AgeResponseOptions.ageOption1.rawValue, AgeResponseOptions.ageOption1),
            (AgeResponseOptions.ageOption2.rawValue, AgeResponseOptions.ageOption2),
            (AgeResponseOptions.ageOption3.rawValue, AgeResponseOptions.ageOption3),
            (AgeResponseOptions.ageOption4.rawValue, AgeResponseOptions.ageOption4)
        ]
    )

    var ageResponse: AgeResponseOptions? {
        get {
            if let _age = model.age {
                switch _age {
                    case ...28:
                        return .ageOption1
                    case 28 ..< 32:
                        return .ageOption2
                    case 32 ..< 34:
                        return .ageOption3
                    case 34...:
                        return .ageOption4
                    default:
                        return nil
                }
            }
            return nil
        }
        set {
            switch newValue {
                case .ageOption1:
                    model.age = 25
                case .ageOption2:
                    model.age = 29
                case .ageOption3:
                    model.age = 33
                case .ageOption4:
                    model.age = 35
                default:
                    model.age = nil
            }
        }
    }


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

    // U

    // MARK: - Umbilical acidic
    let umbilicalAcidicQuestion = BroadGCNQuestion(
        emphasizedText: "Umbilical",
        text: "arterial cord pH < 7.1 from perinatal asphyxia",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var umbilicalAcidicResponse: Bool? {
        get { model.umbilicalAcidic }
        set { model.umbilicalAcidic = newValue }
    }

    // MARK: - Umbilical prolapse
    let umbilicalProlapseQuestion = BroadGCNQuestion(
        emphasizedText: "Umbilical",
        text: "cord prolapse with perinatal asphyxia",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var umbilicalProlapseResponse: Bool? {
        get { model.umbilicalProlapse }
        set { model.umbilicalProlapse = newValue }
    }

    struct BroadGCNQuestion<Value> {
        var emphasizedText: String?
        let text: String
//        var response: Value?
        let responses: [(display: String, value: Value)]
    }
}
