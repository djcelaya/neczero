//
//  GutCheckNECViewModel.swift
//  NEC-Zero
//
//  Created by David Celaya on 1/6/21.
//

import SwiftUI

class GutCheckNECViewModel: ObservableObject {

	private var gutCheckNEC: GutCheckNEC

	let gestationalAgeOptions = [
		"<28",
		"28-31 6/7",
		">= 32"
	]

	@Published var gestationalAgeIndex = 0 {
		didSet {
			if gestationalAgeIndex == 0 {
				gutCheckNEC.gestationAge = 27
			} else if gestationalAgeIndex == 1 {
				gutCheckNEC.gestationAge = 28
			} else {
				gutCheckNEC.gestationAge = 32
			}

		}
	}

	let raceOptions = [
		"Black",
		"Hispanic",
		"Other races"
	]

	@Published var raceIndex = 0

	@Published var points = 0

	func submit() {
		points = gutCheckNEC.points
	}


	init(with model: GutCheckNEC) {
		gutCheckNEC = model
	}
}
