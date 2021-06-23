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

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var title: String?
    let listItems: [String] // this should be StringProtocol - either String or LocalizedStringKey depending on use
    let style: Style = .Unordered

    var body: some View {
        LazyVStack(alignment: .leading) {
            if let _title = title {
                Text(_title)
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
            }
//            Divider()
            LazyVGrid(columns: columns) {
                ForEach(listItems, id: \.self) { item in
                    Text("•")
                    Text(item)
                }
            }
        }
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
            .padding([.leading, .trailing])
    }
}
