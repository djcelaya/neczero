//
//  NECHowView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/how-does-nec-happen
//
//  Created by David Celaya-Gonzalez on 5/24/21.
//

import SwiftUI

struct NECHowView: View {

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Although experts don’t agree...")
                    .padding([.leading, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("An immature immune system that responds in a way that is not helpful to bacteria")
                    Text("•")
                    Text("A lack of good bacteria in the intestine to outweigh the effects of bad bacteria. A mix (i.e. diversity) of bacteria in the bowel helps the baby to best respond to infections.")
                    Text("•")
                    Text("A vulnerable or weak intestine (because of immaturity)")
                    Text("•")
                    Text("The use of formula instead of breast milk; breast milk provides essential benefits to help the baby develop healthy bacteria in the intestine, makes the layers in the intestine strong and benefits the immune system.")
                    Text("•")
                    Text("Lack of oxygen (seen in difficult deliveries or in babies with heart problems)")
                }.padding([.leading, .trailing, .bottom])
            }//.padding([.leading, .trailing])
        }.navigationTitle("How does NEC happen?")
    }
}

struct NECHowView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    NECHowView()
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
