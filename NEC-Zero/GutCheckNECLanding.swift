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
                HStack {
                    VStack {
                        NavigationLink(destination: BroadGCNFormContainer()) {
                            VStack {
                                Text("Broad Risk Assessment")
                                Text("GUIDED")
                                Text("< 2500 grams")
                            }
                        }
                        .padding() // TODO - convert these modifiers into a single view modifier?
                        .background(Color("GutCheck Medium"))
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(15)
                        NavigationLink(destination: BroadGCNFormContainer()) {
                            VStack {
                                Text("Focused Risk Assessment")
                                Text("GUIDED")
                                Text("< 1500 grams")
                            }
                        }.actionButtonStyle()
                    }
                    VStack {
                        NavigationLink(destination: FocusedGCNFormContainer(displayingCondensedForm: false)) {
                            VStack {
                                Text("Focused Risk Assessment")
                                Text("GUIDED")
                                Text("< 1500 grams")
                            }
                        }.actionButtonStyle()
                        NavigationLink(destination: FocusedGCNFormContainer(displayingCondensedForm: true)) {
                            VStack {
                                Text("Focused Risk Assessment")
                                Text("CONDENSED")
                                Text("< 1500 grams")
                            }
                        }.actionButtonStyle()
                    }
                }
                Spacer()
            }.navigationBarHidden(true)
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
        }
    }
}
