//
//  ParentResourcesView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/parent-resources
//
//  Created by David Celaya-Gonzalez on 6/1/21.
//

import SwiftUI

struct ParentResourcesView: View {

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Caring for a preemie...")
                    .padding([.leading, .top, .trailing])
                Text("Nutrition and fluids are given...")
                    .padding([.leading, .top, .trailing])
                Image("NICU 4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Breast milk is recommended...")
                    .padding([.leading, .top, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("being high in immune properties...")
                    Text("•")
                    Text("promoting healthy bacteria in the gut...")
                    Text("•")
                    Text("supporting eye and brain growth...")
                }.padding([.leading, .trailing])
                Text("Sometimes there are circumstances...")
                    .padding([.leading, .top, .trailing])
                Text("Many babies will recover fully from NEC...")
                    .padding([.leading, .top, .trailing])
                Text("For more information about NEC:")
                    .fontWeight(.bold)
                    .padding([.leading, .top, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Link("Medline Plus – Health Topic - Necrotizing Enterocolitis",
                         destination: URL(string: "https://medlineplus.gov/ency/article/001148.htm")!)
                    Text("•")
                    Link("KidsHealth from Nemours - About Necrotizing Enterocolitis",
                         destination: URL(string: "https://kidshealth.org/en/parents/nec.html")!)
                }.padding([.leading, .trailing, .bottom])
            }
        }.navigationBarTitle("Resources & Support Groups", displayMode: .inline)
    }
}

struct ParentResources_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    ParentResourcesView()
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
