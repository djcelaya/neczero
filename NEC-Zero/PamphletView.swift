//
//  PamphletView.swift
//  NEC-Zero
//
//  Created by David Celaya on 2/8/21.
//

import SwiftUI

struct PamphletView: View {

    @State var pageIndex = 0

    var body: some View {
        TabView(selection: $pageIndex) {
            VStack {
                Image(systemName: "heart")
                Text("What is Necrotizing Enterocolitis?")
                Image("NECZeroLogo")
            }.tag(0)
            VStack {
                Text("Overview of NEC")
                Text("""
                    Necrotizing Enterocolitis (NEC): (nek-roh-TIE-zing en-ter-oh-coh-LIE -tis) is
                     a condition where portions of the bowel (intestines) undergo tissue death (necrosis). It can cause the bowel to break open and allow an infection to spread throughout
                     the body.
                """)
                Text("""
                    Infants who develop NEC (often pronounced as “neck”) are typically those born before 32 weeks of pregnancy, but NEC can occur in full term infants as well.
                """)
                Text("""
                    The chance of your baby developing NEC is low. However, NEC is serious and sometimes causes death.
                """)
            }.tag(1)
        }
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeInOut)
        .background(Color.gray)
    }
}

struct PamphletView_Previews: PreviewProvider {
    static var previews: some View {
        PamphletView()
    }
}
