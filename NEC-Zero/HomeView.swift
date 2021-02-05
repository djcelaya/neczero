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

    var body: some View {
        NavigationView() {
            VStack {
                VStack {
                    Image("NECZeroLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading) {
                        Text("NEC-Zero is an intervention...")
                            .padding([.leading, .trailing])
                            .padding(.bottom, 8)
                        NavigationLink("Read more about the NEC-Zero project", destination: NECZeroView())
                            .padding([.leading, .trailing, .bottom])
                    }
                }
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        NavigationLink("What is NEC?", destination: NECView())
                            .padding()
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(15)
                        Button(action: {
                            selectedTab = "GutCheckNEC"
                        }) {
                            Text("GutCheckNEC")
                                .padding()
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                        }
                    }
                    HStack(spacing: 20) {
                        Button(action: {
                            selectedFilter = .Parents
                            selectedTab = "Resources"
                        }) {
                            Text("Resources for Parents")
                                .padding()
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
                                .padding()
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                        }
                    }
                }
            }
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
