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

struct WebLink: Identifiable {
    let title: String
    let url: String
    var description: LocalizedStringKey?
    var id: String { title }
}

struct LinkList: View {

    var title: String?
    let links: [WebLink]

    var body: some View {
        LazyVStack(alignment: .leading) {
            if let _title = title {
                Text(_title)
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
            }
            Divider()
            ForEach(links) { link in
                Link(destination: URL(string: link.url)!) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(link.title)
                            .font(.title3)
                        if let _description = link.description {
                            Text(_description)
                                .foregroundColor(.black)
                        }
                    }.padding([.leading, .trailing])
                    Spacer()
                }
                Divider()
            }

        }
    }
}

struct LinkList_Previews: PreviewProvider {
    static var previews: some View {
        LinkList(title: "Breastfeeding Resources", links: BreastfeedingView.breastfeedingResources)
    }
}
