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
                Text("GutCheckNEC is a risk measurement tool...")
                    .padding(.horizontal)
                    .padding(.bottom)
                VStack(spacing: 16) {
                    NavigationLink(destination: FocusedGCNFormContainer(displayingCondensedForm: true)) {
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Focused Risk Assessment")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("for neonates < 1500 grams")
                                    .font(.body)
                                    .padding(.bottom, 1)
                                Text("A 10 question form that produces a score and associated risk level.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                            }
                            Spacer()
                        }
                    }.actionButtonStyle()
                    NavigationLink(destination: BroadGCNForm()) {
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Text("Broad Risk Assessment")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text("for neonates < 2500 grams")
                                    .font(.body)
                                    .padding(.bottom, 1)
                                Text("A 32 question form that summarizes the number of risk factors to enhance risk awareness.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                            }
                        }
                            Spacer()
                    }.actionButtonStyle()
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ActionButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("GutCheck Medium"))
            .foregroundColor(.white)
            .font(.title2)
            .cornerRadius(15)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
    }
}

extension View {
    func actionButtonStyle() -> some View {
        return self.modifier(ActionButtonStyle())
    }
}

struct GutCheckNECLanding_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            GutCheckNECLanding().tabItem {
                VStack {
                    Image(systemName: "heart.text.square")
                    HStack(alignment: .center, spacing: 0) {
                        Text("GutCheck") + Text("NEC").baselineOffset(-10)
                    }
                }
            }
//            .preferredColorScheme(.dark)
        }
    }
}
