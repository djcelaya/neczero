//
//  Articles.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/1/21.
//

import Combine

class Articles: ObservableObject {

    enum Filters: String, Identifiable, CaseIterable {
        case All = "All"
        case Parents = "Parents"
        case Professionals = "Professionals"
        case Prevention = "Prevention"
        var id: String { rawValue }
    }
    
    @Published var articles: [Article]
    @Published var selectedFilter: Filters

    init(withFilter filter: Filters = .All) {
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
        selectedFilter = filter
    }
}

struct Article: Identifiable {

    enum Tag: String {
        case Parents = "Parents"
        case Professionals = "Professionals"
        case Prevention = "Prevention"
    }

    let title: String
    let tag: Tag
    var id: String { title }
}
