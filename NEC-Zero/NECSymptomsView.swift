//
//  NECSymptomsView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/nec-symptoms
//
//  Created by David Celaya-Gonzalez on 5/28/21.
//

import SwiftUI

struct NECSymptomsView: View {

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("The signs and symptoms of NEC can be...")
                    .padding([.leading, .top, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("Swollen, red, grey or tender belly (abdomen)")
                    Text("•")
                    Text("Difficulty feeding or digesting feeding")
                    Text("•")
                    Text("Showing less activity or energy than usual")
                    Text("•")
                    Text("Unstable body temperature (either cold or hot)")
                    Text("•")
                    Text("Diarrhea")
                }.padding([.leading, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("Bloody poop (stools)")
                    Text("•")
                    Text("Vomiting (possibly green in color)")
                    Text("•")
                    Text("More short periods without...")
                }.padding([.leading, .trailing, .bottom])
                Text("Things to watch for:")
                    .padding([.leading, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("Blood in dirty diaper")
                    Text("•")
                    Text("Stops breathing (apnea)")
                    Text("•")
                    Text("Heartbeat slows down (bradycardia)")
                    Text("•")
                    Text("Body temperature too low or too high")
                    Text("•")
                    Text("Less active or change in behavior")

                }.padding([.leading, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("Not digesting feedings well")
                }.padding([.leading, .trailing, .bottom])
            }//.padding([.leading, .trailing])
        }.navigationBarTitle("What are the symptoms of NEC?", displayMode: .inline)
    }
}

struct NECSymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    NECSymptomsView()
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
