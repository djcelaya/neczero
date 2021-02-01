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
                        NavigationLink(destination: view(for: article.id)) {
                            Text(LocalizedStringKey(article.title))
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }.navigationBarTitle(Text("Resources"))
        }
    }

    @ViewBuilder
    func view(for key: String) -> some View {
        switch key {
            case "Role of Parents":
                ParentsRoleView()
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
