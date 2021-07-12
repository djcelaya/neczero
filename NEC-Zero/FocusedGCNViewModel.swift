//
//  FocusedGCNViewModel.swift
//  NEC-Zero
//
//  View model for focused GutCheckNEC (GCN) risk assessment model.
//
//  Created by David Celaya-Gonzalez on 1/6/21.
//  Copyright © 2021 The Arizona Board of Regents on behalf of The University of Arizona.
//

import Combine

class FocusedGCNViewModel: ObservableObject {

    @Published private var model: FocusedGutCheckNEC

    // MARK: - Gestational age

    let gestationalAgeTitle = "Gestational age (weeks)"
    let gestationalAgeDescription = "Calculate GA in weeks at birth..."

    enum GestationalAgeResponseOptions: String, CaseIterable, Identifiable {
        case option1 = "< 28"
        case option2 = "28-31 6/7"
        case option3 = "≥ 32"
        var id: String { rawValue }
    }

    var gestationalAge: GestationalAgeResponseOptions? {
        get {
            if let age = model.age {
                switch age {
                    case ...28:
                        return .option1
                    case 28 ..< 32:
                        return .option2
                    case 32... :
                        return .option3
                    default:
                        return nil
                }
            }
            return nil
        }
        set {
            switch newValue {
                case .option1:
                    model.age = 27
                case .option2:
                    model.age = 30
                case .option3:
                    model.age = 33
                default:
                    model.age = nil
            }
        }
    }

    // MARK: - Race

    let raceTitle = "Race"

    enum RaceOptions: String, CaseIterable, Identifiable {
        case black = "Black"
        case hispanic = "Hispanic"
        case other = "Other races"
        var id: String { rawValue }
    }

    var race: RaceOptions? {
        get {
            switch model.race {
                case .black:
                    return .black
                case .hispanic:
                    return .hispanic
                case .other:
                    return .other
                default:
                    return nil
            }
        }
        set {
            switch newValue {
                case .black:
                    model.race = .black
                case .hispanic:
                    model.race = .hispanic
                case .other:
                    model.race = .other
                default:
                    model.race = nil
            }
        }
    }

    // MARK: - Outborn

    let outbornTitle = "Outborn"
    let outbornDescription = "If the infant is transferred into this center..."

    var outborn: Bool? {
        get {
            if let outborn = model.outborn {
                return outborn
            }
            return nil
        }
        set {
            model.outborn = newValue
        }
    }

    // MARK: - NICU NEC rate
    let necRateTitle = "NICU NEC rate"
    let necRateDescription = "This is the annual calculated NEC rate..."

    enum NecRateOptions: String, CaseIterable, Identifiable {
        case option1 = "< 2%"
        case option2 = "2-4.99%"
        case option3 = "5-7.99%"
        case option4 = "8-11.99%"
        case option5 = "> 12%"
        var id: String { rawValue }
    }

    var necRate: NecRateOptions? {
        get {
            if let necRate = model.necRate {
                switch necRate {
                    case 0 ..< 2:
                        return .option1
                    case 2 ..< 5:
                        return .option2
                    case 5 ..< 8:
                        return .option3
                    case 8 ..< 12:
                        return .option4
                    case 12 ..< 99:
                        return .option5
                    default:
                        return nil
                }
            }
            return nil
        }
        set {
            switch newValue {
                case .option1:
                    model.necRate = 1
                case .option2:
                    model.necRate = 3
                case .option3:
                    model.necRate = 6
                case .option4:
                    model.necRate = 9
                case .option5:
                    model.necRate = 13
                default:
                    model.necRate = nil
            }
        }
    }


    let necRateOptions = [
        "2-4.99%",
        "5-7.99%",
        "8-11.99%",
        "> 12%"
    ]

    @Published var necRateIndex = 1 {
        didSet {
            if necRateIndex == 0 {
                model.necRate = 2
            } else if necRateIndex == 1 {
                model.necRate = 6
            } else if necRateIndex == 2 {
                model.necRate = 10
            } else { // necRateIndex = 3
                model.necRate = 13
            }
        }
    }

    // MARK: - Exclusive human milk feeding

    let milkTitle = "Exclusive human milk feeding"
    let milkDescription = "Defined as human milk fed..."

    var milk: Bool? {
        get {
            if let milkFeeding = model.humanMilkFeeding {
                return milkFeeding
            }
            return nil
        }
        set {
            model.humanMilkFeeding = newValue
        }
    }

    @Published var milkFeeding = true {
        didSet {
            model.humanMilkFeeding = milkFeeding
        }
    }

    // MARK: - Probiotics

    let probioticsTitle = "Probiotics"
    let probioticsDescription = "If any probiotic preparation..."

    var probiotics: Bool? {
        get {
            if let probiotics = model.probiotics {
                return probiotics
            }
            return nil
        }
        set {
            model.probiotics = newValue
        }
    }

    // MARK: - Culture-proven infections

    let infectionsTitle = "How many culture-proven infections..."

    enum InfectionOptions: String, CaseIterable, Identifiable {
        case none = "None"
        case one = "One"
        case two = "Two"
        var id: String { rawValue }
    }

    var infections: InfectionOptions? {
        get {
            if let infections = model.infections {
                switch infections {
                    case 0:
                        return FocusedGCNViewModel.InfectionOptions.none
                    case 1:
                        return .one
                    case 2:
                        return .two
                    default:
                        return nil
                }
            }
            return nil
        }
        set {
            switch newValue {
                case .none?:
                    model.infections = 0
                case .one:
                    model.infections = 1
                case .two:
                    model.infections = 2
                default:
                    model.infections = nil
            }
        }
    }

    let infectionsOptions = [
        "One",
        "Two",
        "None"
    ]

    @Published var infectionsIndex = 0 {
        didSet {
            if infectionsIndex == 0 {
                model.infections = 1
            } else if infectionsIndex == 1 {
                model.infections = 2
            } else {
                model.infections = 0
            }
        }
    }

    // MARK: - Packed Red Blood Cell transfusion

    let transfusionTitle = "Packed Red Blood Cell transfusion history"
    let transfusionDescription = "If any PRBC transfusion has been given..."

    var transfusion: Bool? {
        get {
            if let transfusion = model.prbcTransfusion {
                return transfusion
            }
            return nil
        }
        set {
            model.prbcTransfusion = newValue
        }
    }

    @Published var prbcTransfusion = false {
        didSet {
            model.prbcTransfusion = prbcTransfusion
        }
    }

    // MARK: - Hypotension

    let hypotensionTitle = "Hypotension"
    let hypotensionDescription = "If hypotension is severe..."

    var hypotension: Bool? {
        get {
            if let hypotension = model.hypotension {
                return hypotension
            }
            return nil
        }
        set {
            model.hypotension = newValue
        }
    }

    // MARK: - Metabolic Acidosis

    let acidosisTitle = "Metabolic Acidosis"
    let acidosisDescription = "After the 1st 12 hours of life..."

    var acidosis: Bool? {
        get {
            if let acidosis = model.metabolicAcidosis {
                return acidosis
            }
            return nil
        }
        set {
            model.metabolicAcidosis = newValue
        }
    }

    @Published var metabolicAcidosis = false {
        didSet {
            model.metabolicAcidosis = metabolicAcidosis
        }
    }

    var points: Int? {
        return model.points
    }

    enum RiskLevels: String {
        case none = "No Risk"
        case low = "Low Risk"
        case moderate = "Moderate Risk"
        case high = "High Risk"
        case veryHigh = "Very High Risk"
    }

    var risk: RiskLevels {
        if let points = self.points {
            switch points {
                case ..<20:
                    return .low
                case 20...32:
                    return .moderate
                case 33...36:
                    return .high
                case 37...:
                    return .veryHigh
                default:
                    return .none
            }
        }
        return .none
    }
    

    func submit() {
//        points = model.points
    }

    func isCompleted() -> Bool {
        guard
            gestationalAge != nil,
            race != nil
        else {
            return false
        }
        return true
    }

    /* Creates an area of question indices for the questions which have not been answered. Returns nil if all
       all questions have been answered. */
    func incompleteQuestionIndices() -> [Int]? {
        var indices: [Int] = []
        if gestationalAge == nil {
            indices.append(0)   // TODO :- remove magic numbers!!!!
        }
        if race == nil {
            indices.append(1)
        }
        if outborn == nil {
            indices.append(2)
        }
        if necRate == nil {
            indices.append(3)
        }
        if milk == nil {
            indices.append(4)
        }
        if probiotics == nil {
            indices.append(5)
        }
        if infections == nil {
            indices.append(6)
        }
        if transfusion == nil {
            indices.append(7)
        }
        if hypotension == nil {
            indices.append(8)
        }
        if acidosis == nil {
            indices.append(9)
        }
        if indices.isEmpty {
            return nil
        } else {
            return indices
        }
    }

    func reset() {
        model = FocusedGutCheckNEC()
    }

    init(with model: FocusedGutCheckNEC = FocusedGutCheckNEC()) {
        self.model = model
    }
}

extension FocusedGCNViewModel {

    private static let lowRiskModel = FocusedGutCheckNEC(
        age: 27.0,
        race: .other,
        outborn: false,
        necRate: 1.0,
        humanMilkFeeding: true,
        probiotics: true, infections: 0,
        prbcTransfusion: false,
        hypotension: false,
        metabolicAcidosis: false
    )

    static let lowRiskTestData = FocusedGCNViewModel(with: lowRiskModel)
}
