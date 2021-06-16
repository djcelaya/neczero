//
//  WebinarDetail.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/health-professional-resources
//
//  Created by David Celaya-Gonzalez on 6/15/21.
//

import SwiftUI

struct WebinarDetail: View {
    var body: some View {
        ScrollView {
            VStack {

            }
        }.navigationBarTitle("Test")
    }
}

struct WebinarView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView() {
                WebinarDetail()
            }.tabItem {
                VStack {
                    Image(systemName: "book")
                    Text("Resources")
                }
            }
        }
    }
}
