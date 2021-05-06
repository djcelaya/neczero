//
//  BroadGCN.swift
//  NEC-Zero
//
//  Model for broad GutCheckNEC (GCN) risk assessment tool
//
//  Created by David Celaya-Gonzalez on 4/5/21.
//  Copyright © 2021 The Arizona Board of Regents on behalf of The University of Arizona.
//

import Foundation

struct BroadGCN {

    // G
    var growthRestricted: Bool?
    var weight: Int? // grams
    var age: Double? // weeks
    var glucocorticoids: Bool?

    // U
    var umbilicalAcidic: Bool?
    var umbilicalProlapse: Bool?

    // T
    var transfusion: Bool?
    enum NICUCharacteristics {
        case lowAcuityVolume
        case mediumAcuityVolume
        case highAcuityVolume
    }
    var nicuCharacteristics: NICUCharacteristics?
    var antenatalSteroids: Bool?
    var standardizedFeeding: Bool?
    var milk: Bool?
    var probiotics: Bool?

    // C1
    var coldStress: Bool?
    var cocaine: Bool?
    var placentalAbruption: Bool?
    var apgar: Bool?
    var chestCompressions: Bool?
    var epinephrine: Bool?
    var necRate: Double?

    // H
    var histamine2: Bool?
    var resusication: Bool?
    var hypertensive: Bool?

    // E
    enum EnteralFeeding {
        case allFormula
        case formulaHuman
        case bovineFortified
    }
    var enteralFeeding: EnteralFeeding?

    // C2
    var heartDisease: Bool?
    var pdaSurgical: Bool?
    var pdaHemodynamic: Bool?
    var pdaIndomethacin: Bool?
    var multipleInfections: Bool?
    var tripleAntibiotic: Bool?
    var antibioticCourse: Bool?
    var sepsisEarly: Bool?
    var sepsisLate: Bool?
    var chorioamnionitis: Bool?

    // K
//    var points: Int? { pointsForChoices() }
//
//    func pointsForChoices() -> Int? {
//        guard let growthRestricted = self.growthRestricted,
//              let weight = self.weight,
//              let age = self.age,
//              let glucocorticoids = self.glucocorticoids,
//              let umbilicalAcidic = self.umbilicalAcidic,
//              let umbilicalProlapse = self.umbilicalProlapse,
//              let tranfusion = self.transfusion,
//              let nicuCharacteristics = self.nicuCharacteristics,
//              let antenatalSteroids = self.antenatalSteroids,
//              let standardizedFeeding = self.standardizedFeeding,
//              let milk = self.milk,
//              let probiotics = self.probiotics else {
//            return nil
//        }
//
//        var total = 0
//        return total
//    }

    struct BroadGCNResponse<Value> {
        
    }
}
