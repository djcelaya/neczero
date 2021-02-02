//
//  Articles.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/1/21.
//

import Combine

class Articles: ObservableObject {
    
    @Published var articles: [Article]

    init() {
        articles = [
            Article(title: "Role of Parents", tag: .Parents),
            Article(title: "What is NEC?", tag: .Parents),
            Article(title: "How does NEC happen?", tag: .Parents),
            Article(title: "What are the symptoms of NEC?", tag: .Parents),
            Article(title: "Treatment of NEC", tag: .Parents),
            Article(title: "Recovery", tag: .Parents),
            Article(title: "Additional Resources & Support Groups for Parents", tag: .Parents),
            Article(title: "Timely Recognition", tag: .Professionals),
            Article(title: "Caring for Babies with NEC in the Hospital", tag: .Professionals),
            Article(title: "Breastfeeding", tag: .Professionals),
            Article(title: "Additional Resources for Health Professionals", tag: .Professionals),
            Article(title: "Prevention Strategies", tag: .Prevention),
            Article(title: "Importance of Breastfeeding", tag: .Prevention)
        ]
    }
}

enum ArticleTag: String {
    case Parents = "Parents"
    case Professionals = "Professionals"
    case Prevention = "Prevention"
}

struct Article: Identifiable {
//    let id = UUID()
    let title: String
    let tag: ArticleTag
    var id: String { title }
}
