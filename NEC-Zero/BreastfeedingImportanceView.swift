//
//  BreastfeedingImportanceView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/breastfeeding-importance
//
//  Created by David Celaya-Gonzalez on 6/24/21.
//

import SwiftUI

struct BreastfeedingImportanceView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Many consider breast milk to be the ideal...")
                infantDecreases
                infantLifeBenefits
                motherBenefits
            }.padding()
        }.navigationBarTitle("Importance of Breastfeeding", displayMode: .inline)
    }

    static let infantDecreasesItems = [
        "Infant diarrhea",
        "Respiratory infections",
        "Being hospitalized for RSV",
        "Otitis media",
        "Necrotizing enterocolitis",
        "Childhood obesity",
        "Childhood leukemia",
        "Urinary Tract Infections"
    ]

    var infantDecreases: some View {
        LazyVStack(alignment: .leading) {
            Text("Breast milk may decrease an infant’s risk of:")
            TextList(items: BreastfeedingImportanceView.infantDecreasesItems)
        }
    }

    static let infantLifeBenefitsItems = [
        "Support brain development",
        "Lower the risk for diabetes",
        "Reduce the risk for heart disease",
        "Reduce the risk of certain cancers",
        "Protect against asthma and allergies"
    ]

    var infantLifeBenefits: some View {
        LazyVStack(alignment: .leading) {
            Text("Breast milk may also benefit an infant for life by helping to:")
            TextList(items: BreastfeedingImportanceView.infantLifeBenefitsItems)
        }
    }

    static let motherBenefitsItems = [
        "Saving the mother money by not buying formula",
        "Protecting against certain cancers",
        "Helping the body lose weight gained while pregnant",
        "Increasing the bond between mother and baby",
        "Decrease chances of arthritis"
    ]

    var motherBenefits: some View {
        LazyVStack(alignment: .leading) {
            Text("Breast milk may benefit a mother by:")
            TextList(items: BreastfeedingImportanceView.motherBenefitsItems)
        }
    }

    static let protectiveComponentsItems = [
        "Nitrate helps regulate blood flow to the intestines",
        "L-Glutamine helps intestinal cells to grow",
        "Human milk Oligosaccharides help cells grow"
    ]

    var protectiveComponents: some View {
        LazyVStack(alignment: .leading) {
            Text("Studies also show that many components...")
            TextList(items: BreastfeedingImportanceView.protectiveComponentsItems)
        }
    }
}

struct BreastfeedingImportanceView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                BreastfeedingImportanceView()
            }.tabItem {
                VStack {
                    Image(systemName: "book")
                    Text("Resources")
                }
            }
        }
    }
}
