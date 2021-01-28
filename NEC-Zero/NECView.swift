//
//  NECView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 1/26/21.
//

import SwiftUI

struct NECView: View {
    var body: some View {
        VStack {
            Image("NECZeroLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Button(action: {

                }) {
                    Text("what-is-nec-0")
                        .padding([.leading])
                }
                Text("what-is-nec-1")
                    .font(.title)
                    .padding([.leading, .trailing, .top])
                Text("what-is-nec-2")
                    .padding([.leading, .trailing, .top])
                Text("what-is-nec-3")
                    .padding([.leading, .trailing, .top])
                Text("what-is-nec-4")
                    .padding([.leading, .trailing, .top])
                Text("what-is-nec-5")
                    .padding([.leading, .trailing, .top])
                Text("what-is-nec-6")
                    .padding([.leading, .trailing, .top])
            }
            Spacer()
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
                }.tag("NEC")
            }.environment(\.locale, .init(identifier: id))
        }
    }
}
