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
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }.navigationBarTitle("Importance of Breastfeeding", displayMode: .inline)
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
