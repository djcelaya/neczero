//
//  FocusedGCNIntroduction.swift
//  NEC-Zero
//
//  Provides instructions on how to use the Focused GCN form. Has an option to not display this page in the
//  future.
//
//  Created by David Celaya-Gonzalez on 6/30/21.
//

import SwiftUI

struct FocusedGCNIntroduction: View {
    var body: some View {
        VStack {
            Spacer()
            NavigationLink("Start", destination: FocusedGCNGuidedForm())
            Button("Back") {
                // navigation pop
            }
        }
    }
}

struct FocusedGCNIntro_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                FocusedGCNIntroduction()
                    .navigationBarTitle("GutCheckNEC")
            }.tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
