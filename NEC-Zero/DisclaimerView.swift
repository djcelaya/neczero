//
//  DisclaimerView.swift
//  NEC-Zero
//
//  Created by David Celaya on 3/29/21.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("The material provided in this mobile application is for...")
                    .padding()
            }
        }.navigationTitle("Disclaimer")
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                DisclaimerView()
            }.tabItem {
                VStack {

                    Image(systemName: "list.bullet")
                    Text("More")
                }
            }
        }
    }
}
