//
//  HospitalView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/caring-babies-nec-hospital
//
//  Created by David Celaya-Gonzalez on 6/2/21.
//

import SwiftUI

struct HospitalView: View {

    let columns = [
        GridItem(.fixed(20), alignment: .topLeading),
        GridItem(.flexible(), alignment: .topLeading)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Most health professionals working in the NICU...")
                riskFactors
                protectiveFactors
                warningSigns
                feedingIntolerance
                otherSigns
                parentalConcern
            }.padding()
        }.navigationBarTitle("Caring for Babies with NEC in the Hospital", displayMode: .inline)
    }

    var riskFactors: some View {
        LazyVStack(alignment: .leading) {
            Text("Know the Risk Factors")
                .font(.title2)
            LazyVGrid(columns: columns) {
                Text("•")
                Text("Gestational age – infants born at...")
                Text("•")
                Text("Medical history – increased risk...")
                Text("•")
                Text("Race – babies born to parents of...")
                Text("•")
                Text("NICU-specific – know the NEC rate...")
            }
        }
    }

    var protectiveFactors: some View {
        LazyVStack(alignment: .leading) {
            Text("Know the Protective Factors")
                .font(.title2)
            LazyVGrid(columns: columns) {
                Text("•")
                Text("Mother’s own milk (MOM) – a babies exposure...")
                Text("•")
                Text("Standardized feeding protocols – following a standard...")
            }
        }
    }

    var warningSigns: some View {
        LazyVStack(alignment: .leading) {
            Text("Know the Warning Signs")
                .font(.title2)
                .padding(.bottom, 4)
            Text("Abdominal assessment – Most clinicians use...")
            LazyVGrid(columns: columns) {
                Text("•")
                Text("Firm or rigid abdomen*")
                Text("•")
                Text("Dusky colored abdomen*")
                Text("•")
                Text("Distended abdomen")
                Text("•")
                Text("Significant change in abdominal girth")
                Text("•")
                Text("Absent bowel sounds")
            }
            Text("*most concerning signs")
        }
    }

    var feedingIntolerance: some View {
        LazyVStack(alignment: .leading) {
            Text("Feeding Intolerance")
                .font(.title2)
                .padding(.bottom, 4)
            Text("Some degree of feeding intolerance...")
            LazyVGrid(columns: columns) {
                Text("•")
                Text("Bloody stool*")
                Text("•")
                Text("Bloody, coffee ground...")
                Text("•")
                Text("Multiple emesis...")
            }
        }
    }

    var otherSigns: some View {
        LazyVStack(alignment: .leading) {
            Text("Other Signs")
                .font(.title2)
                .padding(.bottom, 4)
            Text("Some signs of NEC can be easily...")
            LazyVGrid(columns: columns) {
                Text("•")
                Text("Unexplained tachycardia")
                Text("•")
                Text("Increased need for respiratory support")
                Text("•")
                Text("Increased apnea/bradycardia episodes")
                Text("•")
                Text("Temperature instability")
                Text("•")
                Text("Change in level of consciousness...")
            }
            LazyVGrid(columns: columns) {
                Text("•")
                Text("Change in skin color...")
                Text("•")
                Text("Hypotension (usually a late sign)")
            }
        }
    }

    var parentalConcern: some View {
        LazyVStack(alignment: .leading) {
            Text("Parental Concern")
                .font(.title2)
                .padding(.bottom, 4)
            Text("It is easy to be caught up...")
        }
    }
}

struct HospitalView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                HospitalView()
            }
        }
    }
}
