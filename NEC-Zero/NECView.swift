//
//  NECView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 1/26/21.
//

import SwiftUI

struct NECView: View {
    var body: some View {
        VStack {
            Image("NECZeroLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Button(action: {

                }) {
                    Text("Read about the NEC-Zero project")
                        .padding([.leading])
                }
                Text("What is NEC?")
                    .font(.title)
                    .padding([.leading, .trailing, .top])
                Text("Necrotizing enterocolitis (nek-roh-TIE-zing en-ter-oh-coh-LIE-tis), also called NEC (often pronounced as “neck”), is an infection that in many cases is followed by redness or swelling of the intestines (bowel).")
                    .padding([.leading, .trailing, .top])
                Text("This infection can cause damage to the bowel over time, which can lead to the death of portions of the bowel. In some cases, a hole can form in the bowel, known as a perforation. If the bowel breaks open, it can cause the infection to spread throughout the body.")
                    .padding([.leading, .trailing, .top])
                Text("Often NEC impacts babies who are born very early and very small. Being born early can increase the risk of NEC because many organs have not yet fully developed and their immune systems are immature. Infants who develop NEC are typically preterm, which means they are born before 32 weeks of pregnancy (gestation). However, NEC can also occur in babies who are born at 37 weeks (full term) of pregnancy.")
                    .padding([.leading, .trailing, .top])
                Text("The chance of your baby developing NEC is low. However, NEC is serious and sometimes causes death.")
                    .padding([.leading, .trailing, .top])
                Text("Sometimes parents and family members are the most aware of changes in their babies’ normal habits. As a parent, it is important to be watchful for some of the signs and symptoms that could mean your baby might be ill.")
                    .padding([.leading, .trailing, .top])
            }
            Spacer()
        }
    }
}

struct NECView_Previews: PreviewProvider {
    static var previews: some View {
        NECView()
    }
}
