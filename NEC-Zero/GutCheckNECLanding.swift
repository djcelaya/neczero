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
                        NavigationLink(destination: NECView()) {
                            VStack {
                                Text("Broad Risk Assessment")
                                Text("< 2500 grams")
                            }
                        }
                        .padding() // TODO - convert these modifiers into a single view modifier?
                        .background(Color("GutCheck Medium"))
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(15)
                    }
                    VStack {
                        NavigationLink(destination: FocusedGutCheckNECForm()) {
                            VStack {
                                Text("Focused Risk Assessment")
                                Text("< 1500 grams")
                            }
                        }.actionButton()
                    }
                }
                Spacer()
            }.navigationBarHidden(true)
        }
    }
}

struct ActionButton: ViewModifier {
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
    func actionButton() -> some View {
        return self.modifier(ActionButton())
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
