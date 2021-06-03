//
//  BreastfeedingView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/breastfeeding
//
//  Created by David Celaya-Gonzalez on 6/2/21.
//

import SwiftUI

struct BreastfeedingView: View {

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView(.vertical) {
            intro
            workplace
        }.navigationBarTitle("Breastfeeding")
    }

    var intro: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            Text("There are many reasons feeding...")
            Text("Feeding breast milk to a premature baby helps")
            LazyVGrid(columns: columns) {
                Text("•")
                Text("lower the chances of developing NEC")
                Text("•")
                Text("protect the baby from infection")
                Text("•")
                Text("control the baby's inflammatory response")
                Text("•")
                Text("mature the premature gut")
                Text("•")
                Text("feedings be tolerated" )
            }
            Text("The importance of colostrum...")
        }.padding([.leading, .trailing])
    }

    var workplace: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            Text("Breastfeeding and the Workplace")
                .font(.title2)
            Text("Increasingly employers are supporting breastfeeding...")
            Text("In 2010, the Patient Protection...")
        }.padding([.leading, .trailing])
    }
}

struct Breastfeeding_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                BreastfeedingView()
            }
        }
    }
}
