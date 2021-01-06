//
//  GutCheckNECViewModel.swift
//  NEC-Zero
//
//  Created by David Celaya on 1/6/21.
//

import Foundation

class GutCheckNECViewModel: ObservableObject {

	private let gutCheckNEC: GutCheckNEC

	let gestationalAgeOptions = [
		"<28",
		"28-31 6/7",
		">= 32"
	]

	init(with model: GutCheckNEC) {
		gutCheckNEC = model
	}
}
