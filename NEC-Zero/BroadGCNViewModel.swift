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

    // T

    // MARK: - Transfusion history
    let transfusionQuestion = BroadGCNQuestion(
        emphasizedText: "Transfusion",
        text: "history, not NPO",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var transfusionResponse: Bool? {
        get { model.transfusion }
        set { model.transfusion = newValue }
    }

    // MARK: - NICU characteristics
    let nicuQuestion = BroadGCNQuestion(
        emphasizedText: "The",
        text: "characteristics of the NICU (volume and acuity)",
        responses: [
            ("High acuity or volume", BroadGCN.NICUCharacteristics.highAcuityVolume),
            ("Medium acuity or volume", BroadGCN.NICUCharacteristics.mediumAcuityVolume),
            ("Low acuity or volume", BroadGCN.NICUCharacteristics.lowAcuityVolume)
        ]
    )

    var nicuResponse: BroadGCN.NICUCharacteristics? {
        get { model.nicuCharacteristics }
        set { model.nicuCharacteristics = newValue }
    }

    // MARK: - Antenatal steroids
    let steroidsQuestion = BroadGCNQuestion(
        emphasizedText: "Treatments",
        text: "that REDUCE risk: Antenatal steroids",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var steroidsResponse: Bool? {
        get { model.antenatalSteroids }
        set { model.antenatalSteroids = newValue }
    }

    // MARK: - Standardized feeding guideline
    let feedingQuestion = BroadGCNQuestion(
        emphasizedText: "Treatments",
        text: "that REDUCE risk: Unit the infant is cared for in has adopted a standardized feeding guideline " +
            "(REDUCES risk)",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var feedingResponse: Bool? {
        get { model.standardizedFeeding }
        set { model.standardizedFeeding = newValue }
    }

    // MARK: - Human milk feeding
    let milkQuestion = BroadGCNQuestion(
        emphasizedText: "Treatments",
        text: "that REDUCE risk: Exclusive human milk feeding (REDUCES risk)",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var milkResponse: Bool? {
        get { model.milk }
        set { model.milk = newValue }
    }

    // MARK: - Probiotics
    let probioticsQuestion = BroadGCNQuestion(
        emphasizedText: "Treatments",
        text: "that REDUCE risk: Probiotics with Bifidobacterium (May REDUCE risk)",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var probioticsResponse: Bool? {
        get { model.probiotics }
        set { model.probiotics = newValue }
    }

    // C1

    // MARK: - Cold stress
    let coldQuestion = BroadGCNQuestion(
        emphasizedText: "Cold",
        text: "Stress",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var coldResponse: Bool? {
        get { model.coldStress }
        set { model.coldStress = newValue }
    }

    // MARK: - Cocaine
    let cocaineQuestion = BroadGCNQuestion(
        emphasizedText: "Cocaine",
        text: "in pregnancy",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var cocaineResponse: Bool? {
        get { model.cocaine }
        set { model.cocaine = newValue }
    }

    // MARK: - Placental abruption
    let abruptionQuestion = BroadGCNQuestion(
        emphasizedText: "Critical",
        text: "Start: Placental abruption",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var abruptionResponse: Bool? {
        get { model.placentalAbruption }
        set { model.placentalAbruption = newValue }
    }

    // MARK: - Apgar
    let apgarQuestion = BroadGCNQuestion(
        emphasizedText: "Critical",
        text: "Start: Five-minute Apgar < 6",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var apgarResponse: Bool? {
        get { model.apgar }
        set { model.apgar = newValue }
    }

    // MARK: - Chest compressions
    let compressionsQuestion = BroadGCNQuestion(
        emphasizedText: "Critical",
        text: "Start: Chest compressions at delivery",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var compressionsResponse: Bool? {
        get { model.chestCompressions }
        set { model.chestCompressions = newValue }
    }

    // MARK: - Epinephrine
    let epinephrineQuestion = BroadGCNQuestion(
        emphasizedText: "Critical",
        text: "Start: Epinephrine in delivery room",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var epinephrineResponse: Bool? {
        get { model.epinephrine }
        set { model.epinephrine = newValue }
    }

    // MARK: - NEC rate
    enum NECRateOptions: String, CaseIterable, Identifiable {
        case rate1 = "< 3%"
        case rate2 = "3-7.99%"
        case rate3 = "> 8%"
        var id: String { rawValue }
    }

    let necRateQuestion = BroadGCNQuestion(
        emphasizedText: "Center's annual",
        text: "NEC rate (<1500 grams)",
        responses: [
            (NECRateOptions.rate1.rawValue, NECRateOptions.rate1),
            (NECRateOptions.rate2.rawValue, NECRateOptions.rate2),
            (NECRateOptions.rate3.rawValue, NECRateOptions.rate3)
        ]
    )

    var necRateResponse: NECRateOptions? {
        get {
            if let _necRate = model.necRate {
                switch _necRate {
                    case ...3:
                        return .rate1
                    case 3 ..< 8:
                        return .rate2
                    case 8...:
                        return .rate3
                    default:
                        return nil
                }
            }
            return nil
        }
        set {
            switch newValue {
                case .rate1:
                    model.necRate = 2
                case .rate2:
                    model.necRate = 5
                case .rate3:
                    model.necRate = 10
                default:
                    model.necRate = nil
            }
        }
    }

    // H

    // MARK: - Histamine-2
    let histamineQueestion = BroadGCNQuestion(
        emphasizedText: "Histamine-2",
        text: "Receptor Blockers",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var histamineResponse: Bool? {
        get { model.histamine2 }
        set { model.histamine2 = newValue }
    }

    // MARK: - Hemodynamic resuscitation
    let resuscitationQuestion = BroadGCNQuestion(
        emphasizedText: "Hemodynamic resuscitation in 1'st week of life",
        text: "(Dopamine, Dobutamine, Epinephrine with hypotension)",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var resuscitationResponse: Bool? {
        get { model.resusication }
        set { model.resusication = newValue }
    }

    // MARK: - Hypertensive disease
    let hypertensiveQuestion = BroadGCNQuestion(
        emphasizedText: "Hypertensive disease",
        text: "in mom (pregnancy-induced or chronic)",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var hypertensiveResponse: Bool? {
        get { model.hypertensive }
        set { model.hypertensive = newValue }
    }

    // E

    // MARK: - Enteral feeding
    let enteralFeedingQuestion = BroadGCNQuestion(
        emphasizedText: "Enteral Feeding",
        text: "",
        responses: [
            ("All Formula", BroadGCN.EnteralFeeding.allFormula),
            ("Formula + human milk", BroadGCN.EnteralFeeding.formulaHuman),
            ("Bovine-fortified", BroadGCN.EnteralFeeding.bovineFortified)
        ]
    )

    var enteralFeedingResponse: BroadGCN.EnteralFeeding? {
        get { model.enteralFeeding }
        set { model.enteralFeeding = newValue }
    }

    // C2

    // MARK: - Heart Disease
    let heartDiseaseQuestion = BroadGCNQuestion(
        emphasizedText: "Cyanotic Congenital Heart Disease",
        text: "",
        responses: [
            ("Yes", true),
            ("No", false)
        ]
    )

    var heartDiseaseResponse: Bool? {
        get { model.heartDisease }
        set { model.heartDisease = newValue }
    }

    // MARK: - PDA surgical

    // MARK: - PDA hemodynamically significant

    // MARK: - PDA treated with Indomethacin

    // MARK: - Multiple infections

    // MARK: - Triple antibiotic therapy

    // MARK: - Initial antibiotic course > 4 days

    // MARK: - Sepsis - Early

    // MARK: - Sepsis - Late

    // MARK: - Chorioamnionitis

    struct BroadGCNQuestion<Value> {
        var emphasizedText: String?
        let text: String
//        var response: Value?
        let responses: [(display: String, value: Value)]
    }
}
