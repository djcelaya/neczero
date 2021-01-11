//
//  GutCheckNECView.swift
//  NEC-Zero
//
//  Created by David Celaya on 1/6/21.
//

import SwiftUI

struct GutCheckNECView: View {

	@ObservedObject var viewModel: GutCheckNECViewModel

    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker(selection: $viewModel.gestationalAgeIndex, label: Text("Gestational age (weeks)")) {
						ForEach(0 ..< viewModel.gestationalAgeOptions.count) {
							Text(viewModel.gestationalAgeOptions[$0])
						}
					}
					Picker("Race", selection: $viewModel.raceIndex) {
						ForEach(0 ..< viewModel.raceOptions.count) {
							Text(viewModel.raceOptions[$0])
						}
					}
					Button("Submit", action: viewModel.submit)
				}
				Section(header: Text("Results")) {
					HStack {
						Text("Points")
						Spacer()
						Text("\(viewModel.points)")
					}
				}
			}
			.navigationBarTitle("GutCheckNEC")
		}

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
