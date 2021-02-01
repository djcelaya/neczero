//
//  MoreView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/1/21.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: NECZeroView()) {
                    Text("NEC-Zero Study")
                }
                Text("Disclaimer")
            }.navigationBarTitle("More")
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MoreView().tabItem {
                VStack {
                    Image(systemName: "gearshape")
                    Text("More")
                }
            }
        }
    }
}
