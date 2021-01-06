//
//  GutCheckNECView.swift
//  NEC-Zero
//
//  Created by David Celaya on 1/6/21.
//

import SwiftUI

struct GutCheckNECView: View {

	@ObservedObject var viewModel: GutCheckNECViewModel

	@State private var gestationalAgeIndex = 0

    var body: some View {
		NavigationView {
			Form {
				Picker(selection: $gestationalAgeIndex, label: Text("Gestational age (weeks)")) {
					ForEach(0 ..< viewModel.gestationalAgeOptions.count) {
						Text(viewModel.gestationalAgeOptions[$0])
					}
				}
			}
		}
		.navigationBarTitle("GutCheckNEC")
    }

	init(with viewModel: GutCheckNECViewModel) {
		self.viewModel = viewModel
	}
}

struct GutCheckNECView_Previews: PreviewProvider {
    static var previews: some View {
		let model = GutCheckNEC()
		let viewModel = GutCheckNECViewModel(with: model)
        return GutCheckNECView(with: viewModel)
    }
}
