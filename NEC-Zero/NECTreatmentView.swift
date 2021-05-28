//
//  NECTreatmentView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/nec-treatment
//
//  Created by David Celaya-Gonzalez on 5/28/21.
//

import SwiftUI

struct NECTreatmentView: View {

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("All infants with NEC need...")
                    .padding([.leading, .top, .trailing])
                LazyVGrid(columns: columns) {
                    Text("•")
                    Text("Stopping all feedings...")
                    Text("•")
                    Text("Removing the air and fluid...")
                    Text("•")
                    Text("Intravenous (IV) fluids and antibiotics")
                    Text("•")
                    Text("X-rays of the abdomen and frequent examinations")
                    Text("•")
                    Text("If needed, a pediatric surgeon consultation to discuss surgery")
                }.padding([.leading, .trailing, .bottom])
                Text("The baby's belly size...")
                    .padding([.leading, .trailing, .bottom])
                Text("If the baby develops a hole inside...")
                    .padding([.leading, .trailing, .bottom])
                Text("Parents, it is important that you understand...")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding([.leading, .trailing, .bottom])
                Text("NEC and Surgery – Sometimes babies whose...")
                    .padding([.leading, .trailing, .bottom])
            }//.padding([.leading, .trailing])
        }.navigationBarTitle("Treatment of NEC", displayMode: .inline)
    }
}

struct NECTreatmentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    NECTreatmentView()
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
