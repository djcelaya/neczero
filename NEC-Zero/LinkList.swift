//
//  LinkList.swift
//  NEC-Zero
//
//  A list of Links that can be used in any context. Visually looks similar to an iOS List but can be used as
//  a child in a container View that has other arbitrary children.
//
//  Created by David Celaya-Gonzalez on 6/10/21.
//

import SwiftUI

struct LinkList: View {

    var title: String?
    var links: [Link<Text>]?

    var body: some View {
        LazyVStack(alignment: .leading) {
            if let _title = title {
                Text(_title)
            }
            Divider()

        }
    }

    init(_ title: String?) {
        self.title = title
    }
}

struct LinkList_Previews: PreviewProvider {
    static var previews: some View {
        LinkList("Breastfeeding Resources")
    }
}
