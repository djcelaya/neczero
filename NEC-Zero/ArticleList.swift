//
//  ArticleList.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/1/21.
//

import SwiftUI

struct ArticleList: View {

    @ObservedObject var viewModel: Articles
    let filters = ["All", "Parents", "Professionals", "Prevention"]
    @State var selectedFilter = "All"

    var body: some View {
        NavigationView() {
            VStack {
                Picker("", selection: $selectedFilter) {
                    ForEach(filters, id: \.self) { filterValue in
                        Text(filterValue).tag(filterValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                List {
                    ForEach(viewModel.articles.filter { matchesSelectedFilter($0.tag.rawValue) }) { article in
                        NavigationLink(destination: view(for: article.id)) {
                            Text(LocalizedStringKey(article.title))
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }.navigationBarTitle(Text("Resources"))
        }
    }

    @ViewBuilder func view(for key: String) -> some View {
        switch key {
            case "Role of Parents":
                ParentsRoleView()
            case "What is NEC?":
                NECView()
            case "How does NEC happen?":
                Text("How does NEC happen?")
            case "What are the symptoms of NEC?":
                Text("What are the symptoms of NEC?")
            case "Treatment of NEC":
                Text("Treatment of NEC")
            case "Recovery":
                Text("Recovery")
            case "Additional Resources & Support Groups for Parents":
                Text("Additional Resources & Support Groups for Parents")
            case "Timely Recognition":
                RecognitionView()
            case "Caring for Babies with NEC in the Hospital":
                Text("Caring for Babies with NEC in the Hospital")
            case "Breastfeeding":
                Text("Breastfeeding")
            case "Additional Resources for Health Professionals":
                Text("Additional Resources for Health Professionals")
            case "Prevention Strategies":
                Text("Prevention Strategies")
            case "Importance of Breastfeeding":
                Text("Importance of Breastfeeding")
            default:
                Text("Invalid String Key")
        }
    }

    func matchesSelectedFilter(_ articleTag: String) -> Bool {
        if selectedFilter == "All" {
            return true
        } else {
            return articleTag == selectedFilter
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
