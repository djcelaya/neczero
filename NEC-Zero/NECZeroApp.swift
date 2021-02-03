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
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "heart")
                            Text("NEC-Zero")
                        }
                    }.tag("NEC")
                ArticleList()
                    .tabItem {
                        VStack {
                            Image(systemName: "book")
                            Text("Resources")
                        }
                    }.tag("Resources")
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
