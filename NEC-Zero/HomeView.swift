//
//  HomeView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/2/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView() {
            VStack {
                Image("NECZeroLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text("NEC-Zero is an intervention...")
                        .padding([.leading, .trailing])
                        .padding(.bottom, 8)
                    NavigationLink("Read more about the NEC-Zero project", destination: NECZeroView())
                        .padding([.leading, .trailing])
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
