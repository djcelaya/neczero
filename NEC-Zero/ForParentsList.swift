//
//  ForParentsList.swift
//  NEC-Zero
//
//  Created by David Celaya on 2/1/21.
//

import SwiftUI

struct ForParentsList: View {
    var body: some View {
        NavigationView() {
            List {
                Text("Role of Parents")
                Text("How does NEC happen?")
                Text("What are the symptoms of NEC?")
                Text("Treatment of NEC")
                Text("Recovery")
                Text("Resources & Support Groups")
            }.navigationBarTitle(Text("For Parents"))
        }
    }
}

struct ForParentsList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                ForParentsList().tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Parents")
                    }
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
