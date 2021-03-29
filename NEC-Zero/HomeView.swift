//
//  HomeView.swift
//  NEC-Zero
//
//  Created by David Celaya-Gonzalez on 2/2/21.
//

import SwiftUI

struct HomeView: View {

    @Binding var selectedTab: String
    @Binding var selectedFilter: Articles.Filters
    var buttonSpacing: CGFloat = 15

    var body: some View {
        NavigationView() {
            VStack {
                VStack {
                    Image("NECZeroLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .bottom, .trailing])
                    VStack(alignment: .leading) {
                        Text("NEC-Zero is an intervention...")
                            .padding([.leading, .trailing])
                            .padding(.bottom, 8)
                        NavigationLink("Read more about the NEC-Zero project", destination: NECZeroView())
                            .padding([.leading, .trailing, .bottom])
                    }
                }
                GeometryReader { geometry in
                    let buttonSize = geometry.size.width/2 - buttonSpacing/2
                    VStack(spacing: buttonSpacing) {
                        HStack(spacing: buttonSpacing) {
                            NavigationLink("What is NEC?", destination: NECView())
                                .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                            Button(action: {
                                selectedTab = "GutCheckNEC"
                            }) {
                                Text("GutCheckNEC")
                                    .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .cornerRadius(15)
                            }
                        }
                        HStack(spacing: buttonSpacing) {
                            Button(action: {
                                selectedFilter = .Parents
                                selectedTab = "Resources"
                            }) {
                                Text("Resources for Parents")
                                    .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .cornerRadius(15)
                            }
                            Button(action: {
                                selectedFilter = .Professionals
                                selectedTab = "Resources"
                            }) {
                                Text("Resources for Professionals")
                                    .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                    .background(Color("PrimaryColor"))
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .cornerRadius(15)
                            }
                        }
                    }
                }
                .background(Color(.green))
                .padding()
                Spacer()
            }.navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            HomeView(selectedTab: .constant("NEC"), selectedFilter: .constant(.All))
                .tabItem {
                Image(systemName: "house")
                Text("NEC-Zero")
            }
        }
    }
}
