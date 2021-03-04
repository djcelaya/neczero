//
//  FocusedGCNFormContainer.swift
//  NEC-Zero
//
//  View that displays the focused GutCheckNEC (GCN) risk assessment in either the guided or condensed formats.
//
//  Created by David Celaya-Gonzalez on 3/3/21.
//

import SwiftUI

struct FocusedGCNFormContainer: View {

    @ObservedObject var viewModel: FocusedGCNViewModel
    @State private var displayCondensedForm = false

    var body: some View {
        Group {
            if displayCondensedForm {
                FocusedGCNCondensedForm()
            } else {
                FocusedGCNGuidedForm()
            }
        }
        .navigationBarTitle("GutCheckNEC")
        .navigationBarItems(
            trailing:
                Button("Switch") {
                    displayCondensedForm = !displayCondensedForm
                }
        )
    }

    init(with viewModel: FocusedGCNViewModel = FocusedGCNViewModel()) {
        self.viewModel = viewModel
    }
}

struct FocusedGCNFormContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                FocusedGCNFormContainer()
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
