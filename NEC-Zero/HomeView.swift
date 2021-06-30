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
    var hasAcceptedDisclaimer: Bool { UserDefaults.standard.bool(forKey: "Disclaimer") }
    @State var isPresentingDisclaimer = false
    @State var requestedTab: String?
    @State var requestedNEC: Bool
    @State var displayingNECView: Bool

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
                            // FIX - this does not work the first time accepting the disclaimer
                            if hasAcceptedDisclaimer {
                                NavigationLink(destination: NECView(), isActive: $displayingNECView) {
                                    VStack {
                                        Text("What is")
                                        Text("NEC?")
                                    }
                                }
                                .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                            } else {
                                Button(action: {
                                    requestedNEC = true
                                    isPresentingDisclaimer = true
                                }) {
                                    VStack {
                                        Text("What is")
                                        Text("NEC?")
                                    }
                                }
                                .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                            }
                            Button(action: {
                                goToProtected(tab: "GutCheckNEC")
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
                                goToProtected(tab: "Resources", withFilter: .Parents)
                            }) {
                                VStack {
                                    Text("Resources")
                                    Text("for")
                                    Text("Parents")
                                }
                                .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                .background(Color("PrimaryColor"))
                                .foregroundColor(.white)
                                .font(.title2)
                                .cornerRadius(15)
                            }
                            Button(action: {
                                goToProtected(tab: "Resources", withFilter: .Professionals)
                            }) {
                                VStack {
                                    Text("Resources")
                                    Text("for")
                                    Text("Professionals")
                                }
                                .frame(width: buttonSize, height: buttonSize, alignment: .center)
                                .homeButtonStyle()
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isPresentingDisclaimer, onDismiss: didDismiss) {
                DisclaimerView($isPresentingDisclaimer)
            }
        }
    }

    func goToProtected(tab: String, withFilter filter: Articles.Filters = .All) {
        requestedTab = tab
        selectedFilter = filter
        if hasAcceptedDisclaimer {
            selectedTab = tab
        } else {
            isPresentingDisclaimer = true
        }
    }

    func didDismiss() {
        if hasAcceptedDisclaimer {
            if let _requestedTab = requestedTab {
                selectedTab = _requestedTab
                requestedTab = nil
            }
            if requestedNEC {
                displayingNECView = true
            }
        }
    }

    init(selectedTab: Binding<String>, selectedFilter: Binding<Articles.Filters>) {
        _selectedTab = selectedTab
        _selectedFilter = selectedFilter
        _displayingNECView = State(initialValue: false)
        _requestedNEC = State(initialValue: false)
    }
}

struct HomeButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color("PrimaryColor"))
            .foregroundColor(.white)
            .font(.title2)
            .cornerRadius(15)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

extension View {
    func homeButtonStyle() -> some View {
        return self.modifier(HomeButtonStyle())
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
