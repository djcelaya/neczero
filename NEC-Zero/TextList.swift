//
//  TextList.swift
//  NEC-Zero
//
//  A list of Text views that can be numbered or bulleted. Visually simialr to an iOS list but can be used
//  as a child in a container View that has other arbitrary children.
//
//  Created by David Celaya-Gonzalez on 6/21/21.
//

import SwiftUI

struct TextList: View {

    enum Style {
        case Ordered
        case Unordered
    }

    var title: String?
    let listItems: [String]

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

    init(title: String?, items: [String]) {
        if let _title = title {
            self.title = _title
        }
        self.listItems = items
    }

    init(items: [String]) {
        self.listItems = items
    }
}

struct TextList_Previews: PreviewProvider {
    static var previews: some View {
        TextList(items: PreventionStrategiesView.strategies)
    }
}
