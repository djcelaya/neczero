//
//  GutCheckNEC.swift
//  NEC-Zero
//
//	Model for GutCheckNEC risk measurement tool
//
//  Created by David Celaya-Gonzalez on 1/5/21.
//

import Foundation

struct GutCheckNEC {

	var points = 0

	let gestationAge: Double // weeks

	let race: Race

	let outborn: Bool

	let necRate: Double // percentage

	let humanMilkFeeding: Bool

	let probiotics: Bool

	let infections: Int

	let prbcTransfusion: Bool

	let hypotension: Bool

	let metabolicAcidosis: Bool

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

		points += points(forGestationAge: gestationAge)
		points += points(forRace: race)
	}

	init() {
		gestationAge = 28
		race = .hispanic
		outborn = true
		necRate = 6
		humanMilkFeeding = false
		probiotics = true
		infections = 1
		prbcTransfusion = true
		hypotension = false
		metabolicAcidosis = true
		points = pointsForChoices()
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

	private func points(for outborn: Bool) -> Int {
		return outborn ? 3 : 0
	}

//	private func points(for necRate: Double) -> Int {
//		if necRate < 2 {
//			
//		}
//	}

	private func pointsForChoices() -> Int {
		return 24
	}

}

extension GutCheckNEC {

	enum GestationAge {
		case ageRange1
		case ageRange2
		case ageRange3
	}

	enum Race {
		case black
		case hispanic
		case other
	}

	enum NECRate {
		case rateInterval1
		case rateInterval2
		case rateInterval3
		case rateInterval4
	}
}
