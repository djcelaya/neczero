//
//  GutCheckNEC.swift
//  NEC-Zero
//
//  Model for GutCheckNEC risk measurement tool
//
//  Created by David Celaya-Gonzalez on 1/5/21.
//

import Foundation

struct GutCheckNEC {

    var points: Int {
        pointsForChoices()
    }

    var gestationAge: Double // weeks

    var race: Race

    var outborn: Bool

    var necRate: Double // percentage

    var humanMilkFeeding: Bool

    var probiotics: Bool

    var infections: Int

    var prbcTransfusion: Bool

    var hypotension: Bool

    var metabolicAcidosis: Bool

    init(gestationAge: Double,
         race: Race,
         outborn: Bool,
         necRate: Double,
         humanMilkFeeding: Bool,
         probiotics: Bool,
         infections: Int,
         prbcTransfusion: Bool,
         hypotension: Bool,
         metabolicAcidosis: Bool) {
        self.gestationAge = gestationAge
        self.race = race
        self.outborn = outborn
        self.necRate = necRate
        self.humanMilkFeeding = humanMilkFeeding
        self.probiotics = probiotics
        self.infections = infections
        self.prbcTransfusion = prbcTransfusion
        self.hypotension = hypotension
        self.metabolicAcidosis = metabolicAcidosis
        //		points = pointsForChoices()
    }

    init() {
        gestationAge = 28
        race = .hispanic
        outborn = false
        necRate = 6
        humanMilkFeeding = true
        probiotics = true
        infections = 1
        prbcTransfusion = false
        hypotension = false
        metabolicAcidosis = false
        //		points = pointsForChoices()
    }

    private func points(forGestationAge weeks: Double) -> Int {
        if weeks < 28 {
            return 9
        } else if weeks < 32 {
            return 8
        } else { // >= 32
            return 0
        }
    }

    private func points(forRace race: Race) -> Int {
        switch race {
            case .black:
                return 2
            case .hispanic:
                return 2
            case .other:
                return 0
        }
    }

    private func points(forOutborn outborn: Bool) -> Int {
        return outborn ? 3 : 0
    }

    private func points(forNECRate necRate: Double) -> Int {
        switch necRate {
            case 0 ..< 5:
                return 9
            case 5 ..< 8:
                return 16
            case 8 ..< 12:
                return 19
            default:
                return 23
        }
    }

    private func points(forMilkFeeding milkFeeding: Bool) -> Int {
        return milkFeeding ? -3 : 0
    }

    private func points(forProbiotics probiotics: Bool) -> Int {
        return probiotics ? -5 : 0
    }

    private func points(forInfections infections: Int) -> Int {
        switch infections {
            case 1:
                return 4
            case 2:
                return 6
            default:
                return 0
        }
    }

    private func points(forPRBCTransfusion prbcTransfusion: Bool) -> Int {
        return prbcTransfusion ? 8 : 0
    }

    private func points(forHypotension hypotension: Bool) -> Int {
        return hypotension ? 4 : 0
    }

    private func points(forMetabolicAcidosis metabolicAcidosis: Bool) -> Int {
        return metabolicAcidosis ? 3 : 0
    }

    private func pointsForChoices() -> Int {
        var total = 0
        total += points(forGestationAge: gestationAge)
        total += points(forRace: race)
        total += points(forOutborn: outborn)
        total += points(forNECRate: necRate)
        total += points(forMilkFeeding: humanMilkFeeding)
        total += points(forProbiotics: probiotics)
        total += points(forInfections: infections)
        total += points(forPRBCTransfusion: prbcTransfusion)
        total += points(forHypotension: hypotension)
        total += points(forMetabolicAcidosis: metabolicAcidosis)
        return total
    }

}

extension GutCheckNEC {

    enum Race {
        case black
        case hispanic
        case other
    }

}
