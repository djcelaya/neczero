//
//  GutCheckNECLanding.swift
//  NEC-Zero
//
//  Created by David Celaya on 2/16/21.
//

import SwiftUI

struct GutCheckNECLanding: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Image("GutCheckNEC Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("GutCheckNEC is a risk measurement tool for infants at risk for necrotizing enterocolitis. Two versions are available:")
                    .padding(.horizontal)
                HStack {
                    NavigationLink(destination: NECView()) {
                        VStack {
                            Text("Broad Risk Assessment")
                            Text("< 2500 grams")
                        }
                    }
                        .padding()
                        .background(Color("PrimaryColor"))
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(15)
                    NavigationLink(destination: GutCheckNECForm()) {
                        VStack {
                            Text("Focused Risk Assessment")
                            Text("< 1500 grams")
                        }
                    }
                        .padding()
                        .background(Color("PrimaryColor"))
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(15)
                }
//            HStack(alignment: .center, spacing: 0) {
//                Spacer()
//                HStack(spacing: 0) {
//                    Text("GutCheck")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.white)
//                    Text("NEC")
//                        .font(.title2)
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.white)
//                        .baselineOffset(15.0)
//                }
//                Spacer()
//            }
//            .padding()
                Spacer()
            }
        }
    }
}

struct GutCheckNECLanding_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            GutCheckNECLanding().tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    Text("GutCheckNEC")
                }
            }
        }
    }
}
