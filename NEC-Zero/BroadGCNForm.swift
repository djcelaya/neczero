//
//  BroadGCNForm.swift
//  NEC-Zero
//
//  View for broad GutCheckNEC (GCN) risk assessment tool.
//
//  Created by David Celaya-Gonzalez on 4/6/21.
//  Copyright © 2021 The Arizona Board of Regents on behalf of The University of Arizona.
//

import SwiftUI

struct BroadGCNForm: View {

    @ObservedObject var viewModel: BroadGCNViewModel
    @State private var sectionIndex: Int = 0
    private let backgroundColor = Color("GutCheck Light")

    var body: some View {
        TabView(selection: $sectionIndex) {
            Text("G").tag(0)
            Text("U").tag(1)
            Text("T").tag(2)
            Text("C").tag(3)
            Text("H").tag(4)
            Text("E").tag(5)
            Text("C").tag(6)
            Text("K").tag(7)
        }
        .background(backgroundColor)
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeInOut)
    }

    init(with viewModel: BroadGCNViewModel = BroadGCNViewModel()) {
        self.viewModel = viewModel
    }
}

struct BroadGCNForm_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                BroadGCNForm()
                    .navigationBarTitle("GutCheckNEC")
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }

    }
}
