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
//    let link1: () -> NECResourceLink
//    var link2: (() -> NECResourceLink)?
    var links2: (() -> TupleView<(NECResourceLink, NECResourceLink)>)?

    var body: some View {
        LazyVStack(alignment: .leading) {
            if let _title = title {
                Text(_title)
                    .font(.title2)
                    .padding([.leading, .trailing])
            }
            Divider()
//            link1()
            Divider()
        }
    }

//    init(title: String?, _ link: @escaping () -> NECResourceLink) {
//        self.title = title
//        link1 = link
//    }

    init(title: String?, _ links: @escaping () -> TupleView<(NECResourceLink, NECResourceLink)>) {
//        self.init(title: title, link)
//        self.link2 = link2
        self.title = title
        self.links2 = links
    }

}

struct NECResourceLink: View {

    let title: String
    let url: String
    var description: String?

    var body: some View {
        Link(destination: URL(string: url)!) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title3)
                if let _description = description {
                    Text(_description)
                        .foregroundColor(.black)
                }
            }.padding([.leading, .trailing])
            Spacer()
        }
    }
}

struct LinkList_Previews: PreviewProvider {
    static var previews: some View {
        LinkList(title: "Breastfeeding Resources") {
            NECResourceLink(
                title: "La Leche League",
                url: "https://www.llli.org",
                description: "Offers multi-language breastfeeding..."
            )
            NECResourceLink(
                title: "MedlinePlus",
                url: "https://medlineplus.gov/breastfeeding.html",
                description: "Offers breastfeeding information in many...")
//            Text("MedlinePLue")
//            Text("Womenshealth.gov")
        }
    }
}
