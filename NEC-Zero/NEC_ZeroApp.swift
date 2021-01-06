//
//  NEC_ZeroApp.swift
//  NEC-Zero
//
//  Created by David Celaya on 12/4/20.
//

import SwiftUI

@main
struct NEC_ZeroApp: App {

	let model: GutCheckNEC
	let viewModel: GutCheckNECViewModel

    var body: some Scene {
        WindowGroup {
			GutCheckNECView(with: viewModel)
        }
    }

	init() {
		model = GutCheckNEC()
		viewModel = GutCheckNECViewModel(with: model)
	}
}
