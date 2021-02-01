//
//  NEC_ZeroApp.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 12/4/20.
//

import SwiftUI

@main
struct NECZeroApp: App {

	let model: GutCheckNEC
	let viewModel: GutCheckNECViewModel

    @State private var selectedTab = "NEC"

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                NECView()
                    .tabItem {
                        VStack {
                            Image(systemName: "heart")
                            Text("NEC")
                        }
                    }.tag("NEC")
                ForParentsList()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Parents")
                        }
                    }.tag("Parents")
                Text("Professionals")
                    .tabItem {
                        VStack {
                            Image(systemName: "cross")
                            Text("Professionals")
                        }
                    }.tag("Professionals")
                GutCheckNECView(with: viewModel)
                    .tabItem {
                        VStack {
                            Image(systemName: "heart.text.square")
                            Text("GutCheckNEC")
                        }
                    }.tag("GutCheckNEC")
                MoreView()
                    .tabItem {
                        VStack {
//                            Image(systemName: "line.horizontal.3")
//                            Spacer()
//                            Image(systemName: "ellipsis")
//                            Image(systemName: "gearshape")
                            Image(systemName: "list.bullet")
                            Text("More")
                        }
                    }.tag("More")
            }
        }
    }

	init() {
		model = GutCheckNEC()
		viewModel = GutCheckNECViewModel(with: model)
	}
}
