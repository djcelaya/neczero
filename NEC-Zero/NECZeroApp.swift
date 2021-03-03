//
//  NEC_ZeroApp.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 12/4/20.
//

import SwiftUI

@main
struct NECZeroApp: App {

	let model: FocusedGutCheckNEC
	let viewModel: GutCheckNECViewModel
//    let articlesViewModel: Articles

    @State private var selectedTab = "NEC"
    @State private var selectedFilter: Articles.Filters = .All

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                HomeView(selectedTab: $selectedTab, selectedFilter: $selectedFilter)
                    .tabItem {
                        VStack {
                            Image(systemName: "heart")
                            Text("NEC-Zero")
                        }
                    }.tag("NEC")
                ArticleList(selectedFilter: $selectedFilter)
                    .tabItem {
                        VStack {
                            Image(systemName: "book")
                            Text("Resources")
                        }
                    }.tag("Resources")
                GutCheckNECLanding()
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
		model = FocusedGutCheckNEC()
		viewModel = GutCheckNECViewModel(with: model)
//        articlesViewModel = Articles()
	}
}
