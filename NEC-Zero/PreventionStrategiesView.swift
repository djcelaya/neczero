//
//  PreventionStrategiesView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/prevention
//  Video: https://vimeo.com/210346676/4c5295fb76
//
//  Created by David Celaya-Gonzalez on 6/17/21.
//

import SwiftUI

struct PreventionStrategiesView: View {
    var body: some View {
        Text("Prevention Strategies")
    }
}

struct PreventionStrategiesView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                PreventionStrategiesView()
            }.tabItem {
                VStack {
                    Image(systemName: "book")
                    Text("Resources")
                }
            }
        }
    }
}
