//
//  ArticleList.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/1/21.
//

import SwiftUI

struct ArticleList: View {

    @ObservedObject var viewModel: Articles
    let tags = ["Parents", "Professionals", "Prevention"]
    @State var selectedTag = "Parents"

    var body: some View {
        NavigationView() {
            VStack {
                Picker("", selection: $selectedTag) {
                    Text("Parents").tag("Parents")
                    Text("Professionals").tag("Professionals")
                    Text("Prevention").tag("Prevention")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                List {
                    ForEach(viewModel.articles) { article in
                        Text(LocalizedStringKey(article.title))
                    }
//                    Text("Role of Parents")
//                    Text("How does NEC happen?")
//                    Text("What are the symptoms of NEC?")
//                    Text("Treatment of NEC")
//                    Text("Recovery")
//                    Text("Resources & Support Groups")
                }
                .listStyle(PlainListStyle())
            }.navigationBarTitle(Text("Resources"))
        }
    }

    init() {
        viewModel = Articles()
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                ArticleList().tabItem {
                    VStack {
                        Image(systemName: "book")
                        Text("Resources")
                    }
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
