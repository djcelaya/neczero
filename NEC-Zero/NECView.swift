//
//  NECView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 1/26/21.
//

import SwiftUI

struct NECView: View {
    var body: some View {
        ScrollView {
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
                    Text("Necrotizing enterocolitis (nek-roh-TIE-zing en-ter-oh-coh-LIE-tis)...")
                        .padding(.top, 8)
                        .padding([.leading, .trailing])
                    Text("This infection can cause damage to the bowel over time...")
                        .padding(.top, 8)
                        .padding([.leading, .trailing])
                    Text("Often NEC impacts babies who are born very early and very small...")
                        .padding(.top, 8)
                        .padding([.leading, .trailing])
                    Text("The chance of your baby developing NEC is low...")
                        .padding(.top, 8)
                        .padding([.leading, .trailing])
                    Text("Sometimes parents and family members...")
                        .padding(.top, 8)
                        .padding([.leading, .trailing, .bottom])
                }
            }
        }
    }
}

struct NECView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NECView().tabItem {
                    VStack {
                        Image(systemName: "heart")
                        Text("NEC")
                    }
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
