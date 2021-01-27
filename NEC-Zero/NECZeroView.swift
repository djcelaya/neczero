//
//  NECZeroView.swift
//  NEC-Zero
//
//  Created by David Celaya on 1/26/21.
//

import SwiftUI

struct NECZeroView: View {
    var body: some View {
        VStack {
            Image("NECZeroLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text("What is NEC-Zero?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("NEC-Zero is an intervention that is delivered in the Neonatal Intensive Care Unit to prevent and improve timely recognition of necrotizing enterocolitis, known as NEC. The intervention “NEC-Zero” is being tested and reflects a common goal to reduce NEC “to zero” incidence. Technology will support the intervention.")
                    .padding([.leading, .trailing, .top])
                Text("VIDEO HERE")
                    .background(Color.yellow)
                    .padding([.leading, .trailing, .top])
                Text("Who is funding the project?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("The Agency for Healthcare Research and Quality and the Robert Wood Johnson Foundation are funding the study. Banner Health is a key collaborator and Banner Health NICUs will be study sites.")
                    .padding([.leading, .trailing, .top])
                Text("Who is the target population for NEC-Zero?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("Babies targeted to receive NEC-Zero are those born weighing under 1500 grams (or < 3.3 pounds).")
                    .padding([.leading, .trailing, .top])
                Text("What clinical practices are included in NEC-Zero?")
                    .font(.title2)
                    .padding([.leading, .trailing, .top])
                Text("The chance of your baby developing NEC is low. However, NEC is serious and sometimes causes death.")
                    .padding([.leading, .trailing, .top])
            }
            Spacer()
        }
    }
}

struct NECZeroView_Previews: PreviewProvider {
    static var previews: some View {
        NECZeroView()
    }
}
