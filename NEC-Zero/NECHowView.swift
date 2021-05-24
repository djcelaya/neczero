//
//  NECHowView.swift
//  NEC-Zero
//
//  Corresponding webpage: https://neczero.nursing.arizona.edu/how-does-nec-happen
//
//  Created by David Celaya-Gonzalez on 5/24/21.
//

import SwiftUI

struct NECHowView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text("Although experts don’t agree...")
            }.padding([.leading, .trailing])
        }.navigationTitle("How does NEC happen?")
    }
}

struct NECHowView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "es"], id: \.self) { id in
            TabView {
                NavigationView() {
                    NECHowView()
                }
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
