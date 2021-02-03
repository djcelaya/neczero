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
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        NavigationLink("What is NEC?", destination: NECView())
                            .padding()
                            .background(Color("PrimaryColor"))
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(15)
                        Button(action: {

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

                        }) {
                            Text("Resources for Parents")
                                .padding()
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                        }
                        Button(action: {

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
            HomeView()
                .tabItem {
                Image(systemName: "house")
                Text("NEC-Zero")
            }
        }
    }
}
